Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <8e3f8420-6bfd-a6f4-d491-be302807dcd1@linux.intel.com>
References: <20190330102946.3021-1-chris@chris-wilson.co.uk>
 <8e3f8420-6bfd-a6f4-d491-be302807dcd1@linux.intel.com>
Message-ID: <155410877051.24691.5652903200996409646@skylake-alporthouse-com>
Date: Mon, 01 Apr 2019 09:52:50 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] i915: Add gem_vm_create
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOS0wNC0wMSAwOToxMjowOCkKPiAKPiAKPiBPbiAz
MC8wMy8yMDE5IDEwOjI5LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiArICAgICAvKiBWZXJpZnkg
dGhlIHRyaWNrIHdpdGggdGhlIGFzc3VtZWQgdGFyZ2V0IHdvcmtzICovCj4gPiArICAgICB3cml0
ZV90b19hZGRyZXNzKGk5MTUsIGN0eFswXSwgb2JqWzBdLm9mZnNldCwgaTkxNSk7Cj4gPiArICAg
ICBnZW1fcmVhZChpOTE1LCBvYmpbMF0uaGFuZGxlLCAwLCAmcmVzdWx0LCBzaXplb2YocmVzdWx0
KSk7Cj4gPiArICAgICBpZ3RfYXNzZXJ0X2VxKHJlc3VsdCwgaTkxNSk7Cj4gPiArCj4gPiArICAg
ICAvKiBOb3cgY2hlY2sgdGhhdCB3ZSBjYW4ndCB3cml0ZSB0byB2bVswXSBmcm9tIHNlY29uZCBm
ZC92bSAqLwo+ID4gKyAgICAgd3JpdGVfdG9fYWRkcmVzcyhvdGhlciwgY3R4WzFdLCBvYmpbMF0u
b2Zmc2V0LCBvdGhlcik7Cj4gPiArICAgICBnZW1fcmVhZChpOTE1LCBvYmpbMF0uaGFuZGxlLCAw
LCAmcmVzdWx0LCBzaXplb2YocmVzdWx0KSk7Cj4gPiArICAgICBpZ3RfYXNzZXJ0X2VxKHJlc3Vs
dCwgaTkxNSk7Cj4gPiArCj4gCj4gUmVsaWVzIG9uIG9iamVjdHMgYmVpbmcgemVyb2VzIChjaGVj
aykgYW5kIG5laXRoZXIgZmQgYmVpbmcgemVyby4gVG8gYmUgCj4gc2FmZSBhZGQgYXNzZXJ0cyBm
b3IgdGhlIGxhdHRlcj8KCkp1c3QgcmVwbGFjZSBpOTE1LG90aGVyIHRoZXJlIHdpdGggMSwyLiBP
YmplY3RzIGFyZSB2ZXJpZmllZCB0byBiZSB6ZXJvCmluIG90aGVyIHRlc3RzLCBhbmQgaXQncyBh
IGNvcmUgcGllY2Ugb2YgQUJJIHRoYXQgd2UgZG9uJ3QgYWxsb3cKaW5mb3JtYXRpb24gbGVha3Mg
c28gZWFzaWx5LgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
