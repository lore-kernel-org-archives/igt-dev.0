Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20180530103314.30565-1-chris@chris-wilson.co.uk>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <63ebf0fc-38e5-d52d-002b-f4229858c457@intel.com>
Date: Wed, 30 May 2018 09:27:05 -0700
MIME-Version: 1.0
In-Reply-To: <20180530103314.30565-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib: Assert that we do manage to
 submit at least one batch when measuring
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAzMC8wNS8xOCAwMzozMywgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IEFzIHdlIG1lYXN1cmUg
dGhlIHJpbmcgc2l6ZSwgd2UgbmV2ZXIgZXhwZWN0IHRvIGZpbmQgd2UgY2FuIG5vdCBzdWJtaXQK
PiBubyBiYXRjaGVzIGF0IGFsbC4gQXNzZXJ0IGFnYWluc3QgdGhlIHVuZXhwZWN0ZWQuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4g
Q2M6IEFudG9uaW8gQXJnZW56aWFubyA8YW50b25pby5hcmdlbnppYW5vQGludGVsLmNvbT4KPiAt
LS0KPiAgIGxpYi9pOTE1L2dlbV9yaW5nLmMgfCAxICsKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvaTkxNS9nZW1fcmluZy5jIGIvbGliL2k5
MTUvZ2VtX3JpbmcuYwo+IGluZGV4IDEwZDJmMmNkNC4uN2Q2NDE2NWViIDEwMDY0NAo+IC0tLSBh
L2xpYi9pOTE1L2dlbV9yaW5nLmMKPiArKysgYi9saWIvaTkxNS9nZW1fcmluZy5jCj4gQEAgLTEw
MCw2ICsxMDAsNyBAQCBfX2dlbV9tZWFzdXJlX3JpbmdfaW5mbGlnaHQoaW50IGZkLCB1bnNpZ25l
ZCBpbnQgZW5naW5lLCBlbnVtIG1lYXN1cmVfcmluZ19mbGFncwo+ICAgCX0gd2hpbGUgKDEpOwo+
ICAgCj4gICAJaWd0X2Fzc2VydF9lcShfX2V4ZWNidWYoZmQsICZleGVjYnVmKSwgLUVJTlRSKTsK
PiArCWlndF9hc3NlcnQoY291bnQpOwoKTWF5YmUgYSBjb3VydGVzeSBwcmludD8KCldpdGggb3Ig
d2l0aG91dCwKUmV2aWV3ZWQtYnk6IEFudG9uaW8gQXJnZW56aWFubyA8YW50b25pby5hcmdlbnpp
YW5vQGludGVsLmNvbT4KCj4gICAKPiAgIAltZW1zZXQoJml0diwgMCwgc2l6ZW9mKGl0dikpOwo+
ICAgCXNldGl0aW1lcihJVElNRVJfUkVBTCwgJml0diwgTlVMTCk7Cj4gCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
