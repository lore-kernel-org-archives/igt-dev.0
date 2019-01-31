Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBA96ED0A
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Jan 2019 16:14:35 +0000 (UTC)
References: <20190128115436.14527-1-maarten.lankhorst@linux.intel.com>
 <87zhrlynpo.fsf@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <9cc49663-b6f7-48bb-9ced-dfaaf403d11e@linux.intel.com>
Date: Thu, 31 Jan 2019 17:14:32 +0100
MIME-Version: 1.0
In-Reply-To: <87zhrlynpo.fsf@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] debugfs: Fix writing an extra zero out
 of bounds in igt_crc_to_string_extended()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jani Nikula <jani.nikula@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMjgtMDEtMjAxOSBvbSAxMzoyNCBzY2hyZWVmIEphbmkgTmlrdWxhOgo+IE9uIE1vbiwgMjgg
SmFuIDIwMTksIE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRl
bC5jb20+IHdyb3RlOgo+PiBTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRl
bi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+PiAtLS0KPj4gIGxpYi9pZ3RfZGVidWdmcy5j
IHwgOCArKysrLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZGVidWdmcy5jIGIvbGliL2lndF9k
ZWJ1Z2ZzLmMKPj4gaW5kZXggMzY1NmM2NmE1Njc0Li5kMWZjMGZmN2Y3MTAgMTAwNjQ0Cj4+IC0t
LSBhL2xpYi9pZ3RfZGVidWdmcy5jCj4+ICsrKyBiL2xpYi9pZ3RfZGVidWdmcy5jCj4+IEBAIC00
NTgsMTcgKzQ1OCwxNyBAQCBjaGFyICppZ3RfY3JjX3RvX3N0cmluZ19leHRlbmRlZChpZ3RfY3Jj
X3QgKmNyYywgY2hhciBkZWxpbWl0ZXIsIGludCBjcmNfc2l6ZSkKPj4gIAlpbnQgaTsKPj4gIAlp
bnQgbGVuID0gMDsKPj4gIAlpbnQgZmllbGRfd2lkdGggPSAyICogY3JjX3NpemU7IC8qIFR3byBj
aGFycyBwZXIgYnl0ZS4gKi8KPj4gLQljaGFyICpidWYgPSBtYWxsb2MoKGZpZWxkX3dpZHRoKzEp
ICogY3JjLT5uX3dvcmRzICogc2l6ZW9mKGNoYXIpKTsKPj4gKwljaGFyICpidWYgPSBtYWxsb2Mo
KGZpZWxkX3dpZHRoKzEpICogY3JjLT5uX3dvcmRzKTsKPj4gIAo+PiAgCWlmICghYnVmKQo+PiAg
CQlyZXR1cm4gTlVMTDsKPj4gIAo+PiAtCWZvciAoaSA9IDA7IGkgPCBjcmMtPm5fd29yZHM7IGkr
KykKPj4gKwlmb3IgKGkgPSAwOyBpIDwgY3JjLT5uX3dvcmRzIC0gMTsgaSsrKQo+PiAgCQlsZW4g
Kz0gc3ByaW50ZihidWYgKyBsZW4sICIlMCp4JWMiLCBmaWVsZF93aWR0aCwKPj4gIAkJCSAgICAg
ICBjcmMtPmNyY1tpXSwgZGVsaW1pdGVyKTsKPiBPciBrZWVwIHRoZSBsb29wIGNvbmRpdGlvbiBh
bmQgbWFrZSB0aGlzOgo+Cj4gCQlsZW4gKz0gc3ByaW50ZihidWYgKyBsZW4sICIlcyUwKngiLCBp
ID8gJmRlbGltaXRlciA6ICIiLAo+IAkJCSAgICAgICBmaWVsZF93aWR0aCwgY3JjLT5jcmNbaV0p
Owo+Cj4gQWRkaXRpb25hbGx5IGNvdWxkIG1ha2UgdGhlIGRlbGltaXRlciBwYXNzZWQgaGVyZSBh
IGNoYXIqLgoKVGhhdCBpcyBhbHNvIGEgdmFsaWQgc29sdXRpb24uIDopIElzIGl0IG9rIHRvIGdv
IHdpdGggdGhlIHNvbHV0aW9uIEkgcHJvcG9zZWQgb3IgZG8geW91IGhhdmUgYSBzdHJvbmcgcHJl
ZmVyZW5jZSBmb3IgdGhhdD8KCkkgZG9uJ3QgdGhpbmsgd2UgY2FuIGp1c3QgcGFzcyAmZGVsaW1p
dGVyLCB3ZSB3b3VsZCBkZXBlbmQgb24gdGhlIG5leHQgYnl0ZSBpbiBtZW1vcnkgYWNjaWRlbnRh
bGx5IGJlaW5nIFwwLgoKfk1hYXJ0ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldgo=
