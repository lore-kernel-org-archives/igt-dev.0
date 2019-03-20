Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A714D89A1E
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2019 12:17:52 +0000 (UTC)
Date: Wed, 20 Mar 2019 14:17:49 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190320121749.GS4038@platvala-desk.ger.corp.intel.com>
References: <20190320114857.5110-1-simon.ser@intel.com>
 <155308321344.8718.17930913902883307230@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <155308321344.8718.17930913902883307230@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t v3] tests/testdisplay: fix heap overflow
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBNYXIgMjAsIDIwMTkgYXQgMTI6MDA6MTNQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgU2ltb24gU2VyICgyMDE5LTAzLTIwIDExOjQ4OjU3KQo+ID4gKyAgICAg
ICBhcmd2MCA9IHN0cmR1cChhcmd2WzBdKTsKPiA+ICsgICAgICAgaWd0X2Fzc2VydChhcmd2MCk7
Cj4gPiArICAgICAgIGV4ZWNfcGF0aCA9IGRpcm5hbWUoYXJndjApOwo+ID4gICAgICAgICByZXQg
PSBjaGRpcihleGVjX3BhdGgpOwo+ID4gICAgICAgICBpZ3RfYXNzZXJ0X2VxKHJldCwgMCk7Cj4g
Cj4gT25lIHNob3VsZCBhc2sgUGV0cmkgaWYgaWd0X2Fzc2VydF9lcSgpIGlzIGV2ZW4gbGVnYWwg
aW5zaWRlIHRoZSBoZWxwZXIKPiAoaS5lLiBvdXRzaWRlIG9mIGlndF9tYWluIGFuZCBpZ3Rfc3Vi
dGVzdCkuCgoqb3BlbnMgdGVzdGRpc3BsYXkuYyoKCipmaW5kcyBtYWluKCkqCgoqcnVucyBhd2F5
IHNjcmVhbWluZyoKCgpTaG9ydCBhbnN3ZXI6IEl0J3Mgbm90IGxlZ2FsIHRoZXJlCgpMb25nIGFu
c3dlcjoKSXQgd291bGQgYmUgbGVnYWwgdGhlcmUgaWYgYXBwcm9wcmlhdGUgc3RlcHMgYXJlIHRh
a2VuIHRvIGVuc3VyZSBJR1QKY29yZSBrbm93cyBpdCdzIGEgdGVzdCB3aXRob3V0IHN1YnRlc3Rz
LiB0ZXN0ZGlzcGxheSwgYmVpbmcgYSBkaW5vc2F1cgp0aGF0IGhhc24ndCByZWFsaXplZCBpdCdz
IHB1c2hpbmcgdXAgdGhlIGRhaXNpZXMsIGRvZXNuJ3QgdXNlCmlndF9zaW1wbGVfbWFpbiwgb3Ig
Y2FsbCBpZ3Rfc2ltcGxlX2luaXRfcGFyc2Vfb3B0cywgb3Igb3RoZXJ3aXNlIGRvCnRoZSBjb21t
b24gdGhpbmdzIGFueSByZWNlbnRseSB3cml0dGVuIHRlc3QgaXMgZG9pbmcuCgpJdCdzIGFsc28g
Y2FsbGluZyBpZ3Rfc2tpcF9vbl9zaW11bGF0aW9uIGluIGp1c3QgYWJvdXQgdGhlIG9ubHkKcG9z
c2libGUgY29udGV4dCB3aGVyZSBpdCdzIG5vdCBsZWdhbC4KCk5vdGUgdG8gc2VsZjogSHVycnkg
dXAgd2l0aCByZW1vdmluZyBhbGwgY3VzdG9tIG1haW4gZnVuY3Rpb25zLgoKCi0tIApQZXRyaSBM
YXR2YWxhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
