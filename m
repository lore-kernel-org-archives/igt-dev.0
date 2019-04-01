Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20190330102946.3021-1-chris@chris-wilson.co.uk>
 <8e3f8420-6bfd-a6f4-d491-be302807dcd1@linux.intel.com>
 <155410877051.24691.5652903200996409646@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <39c204af-5126-19c1-7f0e-2f81465024bc@linux.intel.com>
Date: Mon, 1 Apr 2019 09:59:53 +0100
MIME-Version: 1.0
In-Reply-To: <155410877051.24691.5652903200996409646@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] i915: Add gem_vm_create
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
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDAxLzA0LzIwMTkgMDk6NTIsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIFR2cnRr
byBVcnN1bGluICgyMDE5LTA0LTAxIDA5OjEyOjA4KQo+Pgo+Pgo+PiBPbiAzMC8wMy8yMDE5IDEw
OjI5LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4+PiArICAgICAvKiBWZXJpZnkgdGhlIHRyaWNrIHdp
dGggdGhlIGFzc3VtZWQgdGFyZ2V0IHdvcmtzICovCj4+PiArICAgICB3cml0ZV90b19hZGRyZXNz
KGk5MTUsIGN0eFswXSwgb2JqWzBdLm9mZnNldCwgaTkxNSk7Cj4+PiArICAgICBnZW1fcmVhZChp
OTE1LCBvYmpbMF0uaGFuZGxlLCAwLCAmcmVzdWx0LCBzaXplb2YocmVzdWx0KSk7Cj4+PiArICAg
ICBpZ3RfYXNzZXJ0X2VxKHJlc3VsdCwgaTkxNSk7Cj4+PiArCj4+PiArICAgICAvKiBOb3cgY2hl
Y2sgdGhhdCB3ZSBjYW4ndCB3cml0ZSB0byB2bVswXSBmcm9tIHNlY29uZCBmZC92bSAqLwo+Pj4g
KyAgICAgd3JpdGVfdG9fYWRkcmVzcyhvdGhlciwgY3R4WzFdLCBvYmpbMF0ub2Zmc2V0LCBvdGhl
cik7Cj4+PiArICAgICBnZW1fcmVhZChpOTE1LCBvYmpbMF0uaGFuZGxlLCAwLCAmcmVzdWx0LCBz
aXplb2YocmVzdWx0KSk7Cj4+PiArICAgICBpZ3RfYXNzZXJ0X2VxKHJlc3VsdCwgaTkxNSk7Cj4+
PiArCj4+Cj4+IFJlbGllcyBvbiBvYmplY3RzIGJlaW5nIHplcm9lcyAoY2hlY2spIGFuZCBuZWl0
aGVyIGZkIGJlaW5nIHplcm8uIFRvIGJlCj4+IHNhZmUgYWRkIGFzc2VydHMgZm9yIHRoZSBsYXR0
ZXI/Cj4gCj4gSnVzdCByZXBsYWNlIGk5MTUsb3RoZXIgdGhlcmUgd2l0aCAxLDIuIE9iamVjdHMg
YXJlIHZlcmlmaWVkIHRvIGJlIHplcm8KPiBpbiBvdGhlciB0ZXN0cywgYW5kIGl0J3MgYSBjb3Jl
IHBpZWNlIG9mIEFCSSB0aGF0IHdlIGRvbid0IGFsbG93Cj4gaW5mb3JtYXRpb24gbGVha3Mgc28g
ZWFzaWx5LgoKSSBrbm93LCB0aGUgImNoZWNrIiBpbiBwYXJlbnRoZXNlcyB3YXMgc3VwcG9zZWQg
dG8gbWVhbiBhIHRpY2tlZCAKY2hlY2tib3gga2luZCBvZiBjaGVjay4gSSB3YXNuJ3QgY2xlYXIg
YXQgYWxsLiA6KCBTbyBJIHdhcyBqdXN0IHNheWluZyAKdG8gcHV0IGluIGEgcXVpY2sgYXNzZXJ0
IG5laXRoZXIgZmQgaXMgemVyby4gT3IgaWYgd2UgY2Fubm90IGV2ZXIgCmltYWdpbmUgcnVubmlu
ZyBJR1Qgd2l0aCBjbG9zZWQgc3RkaW4gbWF5YmUgaXQgZG9lc24ndCBtYXR0ZXIuCgpSZWdhcmRz
LAoKVHZydGtvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
