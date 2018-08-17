Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20180815205924.6949-1-chris@chris-wilson.co.uk>
 <20180815205924.6949-2-chris@chris-wilson.co.uk>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <3124ba47-3d61-0945-73aa-ae7051c85224@intel.com>
Date: Fri, 17 Aug 2018 10:42:30 -0700
MIME-Version: 1.0
In-Reply-To: <20180815205924.6949-2-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] igt/pm_rpm: Avoid at_exit_drm_fd
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAxNS8wOC8xOCAxMzo1OSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IEtlZXAgdGhlIGRybV9m
ZCBvd25lZCBieSBwbV9ycG0gYXMgd2UgbmVlZCB0byByZWxpbnF1aXNoIGFsbCBvd25lcnNoaXAK
PiBvZiB0aGUgZGV2aWNlIGluIG9yZGVyIHRvIHVubG9hZCB0aGUgbW9kdWxlLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgoKTEdUTS4K
UmV2aWV3ZWQtYnk6IEFudG9uaW8gQXJnZW56aWFubyA8YW50b25pby5hcmdlbnppYW5vQGludGVs
LmNvbT4KCj4gLS0tCj4gICB0ZXN0cy9wbV9ycG0uYyB8IDUgKysrKy0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVz
dHMvcG1fcnBtLmMgYi90ZXN0cy9wbV9ycG0uYwo+IGluZGV4IGMwMjEyZWQ3MC4uZjA3ODE2MTdj
IDEwMDY0NAo+IC0tLSBhL3Rlc3RzL3BtX3JwbS5jCj4gKysrIGIvdGVzdHMvcG1fcnBtLmMKPiBA
QCAtNjk3LDcgKzY5NywxMCBAQCBzdGF0aWMgYm9vbCBzZXR1cF9lbnZpcm9ubWVudCh2b2lkKQo+
ICAgCWlmIChoYXNfcnVudGltZV9wbSkKPiAgIAkJZ290byBvdXQ7Cj4gICAKPiAtCWRybV9mZCA9
IGRybV9vcGVuX2RyaXZlcl9tYXN0ZXIoRFJJVkVSX0lOVEVMKTsKPiArCWRybV9mZCA9IF9fZHJt
X29wZW5fZHJpdmVyKERSSVZFUl9JTlRFTCk7Cj4gKwlpZ3RfcmVxdWlyZShkcm1fZmQgIT0gLTEp
Owo+ICsJaWd0X2RldmljZV9zZXRfbWFzdGVyKGRybV9mZCk7Cj4gKwo+ICAgCWRlYnVnZnMgPSBp
Z3RfZGVidWdmc19kaXIoZHJtX2ZkKTsKPiAgIAlpZ3RfcmVxdWlyZShkZWJ1Z2ZzICE9IC0xKTsK
PiAgIAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
