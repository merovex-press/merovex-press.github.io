---
layout: page
title: Diceware
diceware: true
permalink: /diceware/
---

[Diceware](https://web.archive.org/web/20161025134230/http://world.std.com/~reinhold/diceware.html) is used to create cryptographically strong passphrases. It is based on the principle that the truly random selection, based on rolls of dice, of words in a [wordlist](https://web.archive.org/web/20161025134230/http://world.std.com/~reinhold/diceware.wordlist.asc) can result in easily memorable passwords that are also extremely resistant to attack by even the most powerful adversaries. Passwords that are [six words or longer](https://web.archive.org/web/20161025134230/http://world.std.com/~reinhold/dicewarefaq.html#howlong) are thought to be safe for high security applications.

### Automatically Generated Words

Selecting one of these buttons will automatically generate the number of words selected.


<div class='btn-group' role='group' aria-label='Add random words group'>
  <button type='button' class='btn btn-warning genWordsButton' data-words='4' data-rolls='5' data-reset='1'>
    <span class='fa fa-random' aria-hidden='true'></span> 4 Words
  </button>
  <button type='button' class='btn btn-warning genWordsButton' data-words='5' data-rolls='5' data-reset='1'>
    <span class='fa fa-random' aria-hidden='true'></span> 5 Words
  </button>
  <button type='button' class='btn btn-success genWordsButton' data-words='6' data-rolls='5' data-reset='1'>
    <span class='fa fa-random' aria-hidden='true'></span> 6 Words
  </button>
  <button type='button' class='btn btn-success genWordsButton' data-words='7' data-rolls='5' data-reset='1'>
    <span class='fa fa-random' aria-hidden='true'></span> 7 Words
  </button>
  <button type='button' class='btn btn-success genWordsButton' data-words='8' data-rolls='5' data-reset='1'>
    <span class='fa fa-random' aria-hidden='true'></span> 8 Words
  </button>
  <button type='button' class='btn btn-success genWordsButton' data-words='9' data-rolls='5' data-reset='1'>
    <span class='fa fa-random' aria-hidden='true'></span> 9 Words
  </button>
  <button type='button' class='btn btn-success genWordsButton' data-words='10' data-rolls='5' data-reset='1'>
    <span class='fa fa-random' aria-hidden='true'></span> 10 Words
  </button>
  <button type='button' class='btn btn-default genWordsButton' data-words='1' data-rolls='5' data-reset='0'>
    <span class='fa fa-plus' aria-hidden='true'></span> Word
  </button>
  <button type='button' class='btn btn-default genWordsButton' data-words='1' data-rolls='2' data-reset='0'>
    <span class='fa fa-plus' aria-hidden='true'></span> Symbol
  </button>
</div>

### Manually Rolled Words

If you don't trust the Javascript randomization, you can roll your own. Just roll 5d6 to arrive at a number in the range of 11111 to 66666. Type that number into the text field below and hit enter.

<form id='addFiveDieRollWordForm' class='form-inline' data-toggle='validator'>
  <div class='form-group'>
    <label class='sr-only' for='addFiveDieRollWord'>Add Two or Five Die Roll</label>
    <div class='input-group'>
      <div class='input-group-addon'>#</div>
      <input type='text' class='form-control' id='addFiveDieRollWord' placeholder='+ 2 or 5 die roll word' maxlength='5' pattern='^[1-6]{2,5}$'>
    </div>
    <span class='help-block with-errors'></span>
  </div>
</form>

<div class='row'>
<div id='diceWordsCopyableContainer' class='col-8'>
  <h3 class='card-title'>Copyable Text Variations</h3>
  <ul>
  <li><code id='diceWordsCopyableSpace'></code></li>
  <li><code id='diceWordsCopyableDash'></code></li>
  <li><code id='diceWordsCopyableNoGap'></code></li>
  </ul>
</div>
<div class='col'>
<ul id='diceWords' class='list-inline'></ul>
</div>
</div>

<div id='entropyEstimateContainer' class='card card-block'>
  <h3 class='card-title'>Entropy</h3>
  <p class='card-text'>There are <code id='totalWords'></code> words in your password, which is
  ~<code id='totalEntropy'></code>
  bits of entropy
  (<code>~12.92 bits/word</code>
  and
  <code>~5.16/symbol</code>).
  That many words equates to an  effective keyspace of
  ~<code id='crackTimeResultsHalfKeySpace'></code>
  possible keys (
  <code>(7776^words)/2</code>
  which is 50% of the total key space since on average a key will be found in that reduced keyspace). Conservatively assuming an adversary can guess passwords at the rate of a trillion
  (<code id='crackTimeResultsGuessesPerSecond'></code>) keys/second. An exhaustive brute-force search on half the total keyspace might take:</p>

  <ul>
    <li>~<code id='crackTimeResultsSeconds'></code> seconds</li>
    <li>~<code id='crackTimeResultsMinutes'></code> minutes</li>
    <li>~<code id='crackTimeResultsHours'></code> hours</li>
    <li>~<code id='crackTimeResultsDays'></code> days</li>
    <li>~<code id='crackTimeResultsYears'></code> years</li>
    <li>~<code id='crackTimeResultsHumanLifetimes'></code> x avg. lifespan</li>
    <li>~<code id='crackTimeResultsMillenia'></code> millenia</li>
    <li>~<code id='crackTimeResultsUniverseLifetimes'></code> x age Universe</li>
  </ul>
  <a href='https://web.archive.org/web/20161025134230/http://world.std.com/~reinhold/dicewarefaq.html#calculatingentropy' target='_blank'>Learn more about calculating entropy</a>
</div>
