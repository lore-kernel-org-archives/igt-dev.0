Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180302082745.GH5453@intel.com>
References: <20180302081235.28346-1-chris@chris-wilson.co.uk>
 <20180302082745.GH5453@intel.com>
Message-ID: <151997973951.1677.460210607509423463@mail.alporthouse.com>
Date: Fri, 02 Mar 2018 08:35:39 +0000
Subject: Re: [igt-dev] [Intel-gfx] [PATCH igt v2] igt/gen7_forcewake_mt:
 Make the mmio register as volatile
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
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBWaWxsZSBTeXJqw6Rsw6QgKDIwMTgtMDMtMDIgMDg6Mjc6NDUpCj4gT24gRnJpLCBN
YXIgMDIsIDIwMTggYXQgMDg6MTI6MzVBTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4g
UHJldmVudCB0aGUgY29tcGlsZXIgZnJvbSBjYWNoaW5nIHJlYWRzL3dyaXRlcyB0byB0aGUgaHcg
cmVnaXN0ZXIgYXMgd2UKPiA+IGRvIHdhbnQgdG8gcGVyZm9ybSBtbWlvLgo+ID4gCj4gPiBXaGls
c3QgZml4aW5nIHVwIHRoZSBtbWlvIGFjY2VzcywgYWxzbyBlbnN1cmUgdGhhdCB3ZSBkbyBub3Qg
bGVhdmUgdGhlCj4gPiB0ZXN0IHdpdGggYW55IG90aGVyIGJpdHMgc3RpbGwgc2V0IGluIHRoZSBm
b3JjZXdha2UgcmVnaXN0ZXIgdG8gcHJldmVudAo+ID4gYWZmZWN0aW5nIG90aGVyIHRlc3RzLCBh
cyBzcG90dGVkIGJ5IFR2cnRrby4KPiAKPiBJIHdvbmRlciB3aHkgdGhpcyB0ZXN0IGlzbid0IHVz
aW5nIGludGVsX3JlZ2lzdGVyX2FjY2Vzc19pbml0KCkgJiBjby4/Cj4gTWF5YmUgYmVjYXVzZSB0
aGUgbGlicmFyeSBjb2RlIHVzZWQgdG8gdGFrZSB0aGUgZm9yY2V3YWtlIGFsd2F5cz8gQnV0Cj4g
dGhhdCBjb3VsZCBiZSBwcmV2ZW50ZWQgd2l0aCBhIHNldGVudigpIG5vdy4KCkl0IGNvdWxkIGp1
c3QgdXNlIGludGVsX21taW9fdXNlX3BjaV9iYXIoKSBhbmQgdGhlbgppbnRlbF9yZWdpc3Rlcl9h
Y2Nlc3NfaW5pdCgpIGRvZXNuJ3QgaGF2ZSB0byB3b3JyeSBhYm91dCBzaWxseSB0ZXN0cwp0cnlp
bmcgdG8gYWJ1c2UgdGhlIGh3LgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2Cg==
