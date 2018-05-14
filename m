Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3376E04C
 for <igt-dev@lists.freedesktop.org>; Mon, 14 May 2018 13:15:03 +0000 (UTC)
References: <20180320134741.1442-1-lionel.g.landwerlin@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <e6742fcd-0991-d82a-ff79-10a9df2399c0@intel.com>
Date: Mon, 14 May 2018 14:15:01 +0100
MIME-Version: 1.0
In-Reply-To: <20180320134741.1442-1-lionel.g.landwerlin@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib: intel: report GT size from the
 database if available
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UGluZz8KCk9uIDIwLzAzLzE4IDEzOjQ3LCBMaW9uZWwgTGFuZHdlcmxpbiB3cm90ZToKPiBUaGUg
c2NoZW1lIGlmIGdldHRpbmcgdGhlIEdUIHNpemUgZnJvbSB0aGUgUENJLWlkIGRvZXNuJ3Qgd29y
ayBhbnltb3JlCj4gb24gQ29mZmVlbGFrZS4KPgo+IFNpZ25lZC1vZmYtYnk6IExpb25lbCBMYW5k
d2VybGluIDxsaW9uZWwuZy5sYW5kd2VybGluQGludGVsLmNvbT4KPiBCdWd6aWxsYTogaHR0cHM6
Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA1NDUxLCBodHRwczovL2J1
Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDE3NDAKPiAtLS0KPiAgIGxpYi9p
bnRlbF9kZXZpY2VfaW5mby5jIHwgOSArKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA5IGlu
c2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9saWIvaW50ZWxfZGV2aWNlX2luZm8uYyBiL2xp
Yi9pbnRlbF9kZXZpY2VfaW5mby5jCj4gaW5kZXggMWM3MTA3MzMuLmMxMDRjOWM0IDEwMDY0NAo+
IC0tLSBhL2xpYi9pbnRlbF9kZXZpY2VfaW5mby5jCj4gKysrIGIvbGliL2ludGVsX2RldmljZV9p
bmZvLmMKPiBAQCAtNDEwLDggKzQxMCwxNyBAQCB1bnNpZ25lZCBpbnRlbF9nZW4odWludDE2X3Qg
ZGV2aWQpCj4gICAgKi8KPiAgIHVuc2lnbmVkIGludGVsX2d0KHVpbnQxNl90IGRldmlkKQo+ICAg
ewo+ICsJY29uc3Qgc3RydWN0IGludGVsX2RldmljZV9pbmZvICpkZXZpbmZvID0gaW50ZWxfZ2V0
X2RldmljZV9pbmZvKGRldmlkKTsKPiAgIAl1bnNpZ25lZCBtYXNrID0gaW50ZWxfZ2VuKGRldmlk
KTsKPiAgIAo+ICsJLyogSWYgaW4gdGhlIGRhdGFiYXNlLCBqdXN0IHVzZSB0aGF0IGluZm9ybWF0
aW9uLiAqLwo+ICsJaWYgKGRldmluZm8tPmd0ICE9IDApCj4gKwkJcmV0dXJuIGRldmluZm8tPmd0
IC0gMTsKPiArCj4gKwkvKgo+ICsJICogVGhpcyBzY2hlbWUgZG9lc24ndCB3b3JrIG9uIENvZmZl
ZWxha2UsIHdlIHNob3VsZCBwcm9iYWJseQo+ICsJICogbm90IHJlbHkgb24gdGhpcyBhbnltb3Jl
Lgo+ICsJICovCj4gICAJaWYgKG1hc2sgPj0gOCkKPiAgIAkJbWFzayA9IDB4ZjsKPiAgIAllbHNl
IGlmIChtYXNrID49IDYpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
Cg==
