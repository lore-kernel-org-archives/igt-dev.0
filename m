Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Jani Nikula <jani.nikula@linux.intel.com>
In-Reply-To: <20180906084233.34swc4kmzxzcc77r@platvala-desk.ger.corp.intel.com>
References: <20180906000350.2478-1-drawat@vmware.com>
 <20180906000350.2478-2-drawat@vmware.com>
 <20180906084233.34swc4kmzxzcc77r@platvala-desk.ger.corp.intel.com>
Date: Thu, 06 Sep 2018 13:54:29 +0300
Message-ID: <87musuzyje.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 1/5] lib/igt_vmwgfx: Add
 vmwgfx device
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
To: Petri Latvala <petri.latvala@intel.com>, Deepak Rawat <drawat@vmware.com>
Cc: igt-dev@lists.freedesktop.org, thellstrom@vmware.com, linux-graphics-maintainer@vmware.com, intel-gfx@lists.freedesktop.org, syeh@vmware.com
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCAwNiBTZXAgMjAxOCwgUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5j
b20+IHdyb3RlOgo+IE9uIFdlZCwgU2VwIDA1LCAyMDE4IGF0IDA1OjAzOjQ2UE0gLTA3MDAsIERl
ZXBhayBSYXdhdCB3cm90ZToKPj4gQWRkIERSSVZFUl9WTVdHRlggdG8gcmVwcmVzZW50IHZtd2dm
eCBkZXZpY2UgZm9yIHJ1bm5pbmcgaWd0IHRlc3RzLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogRGVl
cGFrIFJhd2F0IDxkcmF3YXRAdm13YXJlLmNvbT4KPj4gLS0tCj4+ICBsaWIvZHJtdGVzdC5jIHwg
OSArKysrKysrKy0KPj4gIGxpYi9kcm10ZXN0LmggfCAzICsrKwo+PiAgMiBmaWxlcyBjaGFuZ2Vk
LCAxMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEvbGli
L2RybXRlc3QuYyBiL2xpYi9kcm10ZXN0LmMKPj4gaW5kZXggYmZhMmUwZjAuLjU2M2Q1YjhiIDEw
MDY0NAo+PiAtLS0gYS9saWIvZHJtdGVzdC5jCj4+ICsrKyBiL2xpYi9kcm10ZXN0LmMKPj4gQEAg
LTEwNSw2ICsxMDUsMTEgQEAgYm9vbCBpc19pOTE1X2RldmljZShpbnQgZmQpCj4+ICAJcmV0dXJu
IF9faXNfZGV2aWNlKGZkLCAiaTkxNSIpOwo+PiAgfQo+PiAgCj4+ICtib29sIGlzX3Ztd2dmeF9k
ZXZpY2UoaW50IGZkKQo+PiArewo+PiArCXJldHVybiBfX2lzX2RldmljZShmZCwgInZtd2ciKTsK
Pj4gK30KPj4gKwo+PiAgc3RhdGljIGJvb2wgaGFzX2tub3duX2ludGVsX2NoaXBzZXQoaW50IGZk
KQo+PiAgewo+PiAgCXN0cnVjdCBkcm1faTkxNV9nZXRwYXJhbSBncDsKPj4gQEAgLTIwNSw3ICsy
MTAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1vZHVsZSB7Cj4+ICAJeyBEUklWRVJfVkM0LCAi
dmM0IiB9LAo+PiAgCXsgRFJJVkVSX1ZHRU0sICJ2Z2VtIiB9LAo+PiAgCXsgRFJJVkVSX1ZJUlRJ
TywgInZpcnRpby1ncHUiIH0sCj4+IC0JeyBEUklWRVJfVklSVElPLCAidmlydGlvX2dwdSIgfSwK
Pj4gKwl7IERSSVZFUl9WTVdHRlgsICJ2bXdnZngiIH0sCj4+ICAJe30KPgo+Cj4gRG9uJ3QgcmVt
b3ZlIHRoZSBzZWNvbmQgdmlydGlvLWdwdSBsaW5lLCB0aGVyZSdzIGEgcmVhc29uIGZvciBpdC4K
Pgo+IC4uLi4gd2Ugc2hvdWxkIHByb2JhYmx5IGFkZCBhIGNvbW1lbnQgdGhlcmUuCgpEb24ndCBr
ZWVwIHVzIGluIHN1c3BlbnNlIQoKSmFuaS4KCgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9wZW4g
U291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXYK
