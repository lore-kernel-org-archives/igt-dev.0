Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D386EAEC
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Apr 2018 10:59:02 +0000 (UTC)
Date: Fri, 13 Apr 2018 12:59:00 +0200
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20180413105900.GE13079@kdec5-desk.ger.corp.intel.com>
References: <20180411023732.32362-1-dhinakaran.pandiyan@intel.com>
 <20180411023732.32362-5-dhinakaran.pandiyan@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180411023732.32362-5-dhinakaran.pandiyan@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 05/20] tests/psr: Assert sink CRC length
 and make use of igt_sysfs_read()
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
To: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBBcHIgMTAsIDIwMTggYXQgMDc6Mzc6MTdQTSAtMDcwMCwgRGhpbmFrYXJhbiBQYW5k
aXlhbiB3cm90ZToKPiBJbmNsdWRlIG1pbm9yIGZvbWF0dGluZyBjaGFuZ2UgdG9vLgo+IFNpZ25l
ZC1vZmYtYnk6IERoaW5ha2FyYW4gUGFuZGl5YW4gPGRoaW5ha2FyYW4ucGFuZGl5YW5AaW50ZWwu
Y29tPgpSZXZpZXdlZC1ieTogS2F0YXJ6eW5hIERlYyA8a2F0YXJ6eW5hLmRlY0BpbnRlbC5jb20+
Cj4gLS0tCj4gIHRlc3RzL2ttc19wc3Jfc2lua19jcmMuYyB8IDkgKysrKy0tLS0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL3Rlc3RzL2ttc19wc3Jfc2lua19jcmMuYyBiL3Rlc3RzL2ttc19wc3Jfc2lua19jcmMuYwo+
IGluZGV4IDM1YzdiODQ1Li5hZjYzZTY4OSAxMDA2NDQKPiAtLS0gYS90ZXN0cy9rbXNfcHNyX3Np
bmtfY3JjLmMKPiArKysgYi90ZXN0cy9rbXNfcHNyX3NpbmtfY3JjLmMKPiBAQCAtMjMwLDE0ICsy
MzAsMTMgQEAgc3RhdGljIHZvaWQgZ2V0X3NpbmtfY3JjKGRhdGFfdCAqZGF0YSwgY2hhciAqY3Jj
KQo+ICAJaWYgKGlndF9pbnRlcmFjdGl2ZV9kZWJ1ZykKPiAgCQlyZXR1cm47Cj4gIAo+IC0JaWd0
X3JlcXVpcmVfZihpZ3Rfc3lzZnNfc2NhbmYoZGF0YS0+ZGVidWdmc19mZCwgImk5MTVfc2lua19j
cmNfZURQMSIsCj4gLQkJCQkgICAgICAiJXNcbiIsIGNyYyksCj4gKwlpZ3RfcmVxdWlyZV9mKGln
dF9zeXNmc19yZWFkKGRhdGEtPmRlYnVnZnNfZmQsICJpOTE1X3NpbmtfY3JjX2VEUDEiLAo+ICsJ
CQkJICAgICBjcmMsIENSQ19MRU4pID09IENSQ19MRU4sCj4gIAkJICAgICAgIlNpbmsgQ1JDIGlz
IHVucmVsaWFibGUgb24gdGhpcyBtYWNoaW5lLiBUcnkgbWFudWFsIGRlYnVnIHdpdGggLS1pbnRl
cmFjdGl2ZS1kZWJ1Zz1uby1jcmNcbiIpOwo+IC0KPiAtCWlndF9kZWJ1ZygiJXNcbiIsIGNyYyk7
Cj4gKwlpZ3RfZGVidWcoInNpbmsgQ1JDOiAlLipzXG4iLCBDUkNfTEVOLCBjcmMpOwo+ICAKPiAg
CS8qIEJsYWNrIHNjcmVlbiBpcyBhbHdheXMgaW52YWxpZCAqLwo+IC0JaWd0X2Fzc2VydChzdHJu
Y21wKGNyYywgQ1JDX0JMQUNLLCBDUkNfTEVOKSAhPSAwKTsKPiArCWlndF9hc3NlcnQoc3RybmNt
cChjcmMsIENSQ19CTEFDSywgQ1JDX0xFTikpOwo+ICB9Cj4gIAo+ICBzdGF0aWMgYm9vbCBpc19n
cmVlbihjaGFyICpjcmMpCj4gLS0gCj4gMi4xNC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBpZ3QtZGV2IG1haWxpbmcgbGlzdAo+IGlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldgo=
