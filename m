Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180820235445.czxuegylrnnxqrzn@smtp.gmail.com>
References: <20180820235445.czxuegylrnnxqrzn@smtp.gmail.com>
Message-ID: <153484656970.20928.15954376005829941190@skylake-alporthouse-com>
Date: Tue, 21 Aug 2018 11:16:09 +0100
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] Skip VBlank tests in
 modules without VBlank
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>, Petri Latvala <petri.latvala@intel.com>, Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: igt-dev@lists.freedesktop.org, Haneen Mohammed <hamohammed.sa@gmail.com>, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBSb2RyaWdvIFNpcXVlaXJhICgyMDE4LTA4LTIxIDAwOjU0OjQ1KQo+IFRoZSBrbXNf
ZmxpcCB0ZXN0IGRvZXMgbm90IHN1cHBvcnQgZHJpdmVycyB3aXRob3V0IFZCbGFuayB3aGljaCBl
eGNsdWRlCj4gc29tZSB2aXJ0dWFsIGRyaXZlcnMuIFRoaXMgcGF0Y2ggYWRkcyBhIGZ1bmN0aW9u
IHRoYXQgY2hlY2tzIGlmIGEgbW9kdWxlCj4gaGFzIGEgVkJsYW5rIG9yIG5vdDsgaWYgYSBtb2R1
bGUgaGFzIFZCbGFuayB0aGFuIGttc19mbGlwIHdpbGwgZXhlY3V0ZQo+IGFsbCB0aGUgVkJsYW5r
IHRlc3RzLCBvdGhlcndpc2UsIFZCbGFuayB0ZXN0cyB3aWxsIGJlIHNraXBwZWQuCj4gCj4gU2ln
bmVkLW9mZi1ieTogUm9kcmlnbyBTaXF1ZWlyYSA8cm9kcmlnb3NpcXVlaXJhbWVsb0BnbWFpbC5j
b20+Cj4gLS0tCj4gIGxpYi9pZ3RfYXV4LmMgICAgfCAxNCArKysrKysrKysrKysrKwo+ICBsaWIv
aWd0X2F1eC5oICAgIHwgIDIgKysKPiAgdGVzdHMva21zX2ZsaXAuYyB8IDI2ICsrKysrKysrKysr
KysrKysrKysrKysrKy0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9hdXguYyBiL2xpYi9pZ3RfYXV4
LmMKPiBpbmRleCAxMjUwZDVjNS4uZGE1YmU0YmIgMTAwNjQ0Cj4gLS0tIGEvbGliL2lndF9hdXgu
Ywo+ICsrKyBiL2xpYi9pZ3RfYXV4LmMKPiBAQCAtNTY0LDYgKzU2NCwyMCBAQCBib29sIGlndF9h
dWJfZHVtcF9lbmFibGVkKHZvaWQpCj4gICAgICAgICByZXR1cm4gZHVtcF9hdWI7Cj4gIH0KPiAg
Cj4gK2Jvb2wgaWd0X3RoZXJlX2lzX3ZibGFuayhpbnQgZHJtX2ZkKQoKSSB3b3VsZCBzdWdnZXN0
IGJyZWFraW5nIG91dCBpbiB0aGUga21zIG5hbWVzcGFjZSwKCmJvb2wga21zX2hhc192Ymxhbmso
aW50IGZkKTsKCj4gK3sKPiArICAgICAgIGRybVZCbGFuayBkdW1teV92Ymw7Cj4gKyAgICAgICBp
bnQgcmV0Owo+ICsKCkVpdGhlciBtZW1zZXQoKSB0aGUgcmVzdCBvciB1c2UgYSBuYW1lZCBpbml0
aWFsaXplci4KCj4gKyAgICAgICBkdW1teV92YmwucmVxdWVzdC50eXBlID0gRFJNX1ZCTEFOS19B
QlNPTFVURTsKPiArICAgICAgIHJldCA9IGRybVdhaXRWQmxhbmsoZHJtX2ZkLCAmZHVtbXlfdmJs
KTsKCnJldHVybiBkcm1XYWl0VmJsYW5rKCkgPT0gMDsKLUNocmlzCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
