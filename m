Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD83B6F9DF
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 15:38:20 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200130151229.984-1-ville.syrjala@linux.intel.com>
 <20200130151229.984-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20200130151229.984-2-ville.syrjala@linux.intel.com>
Message-ID: <158039869616.18112.12469668177959350950@skylake-alporthouse-com>
Date: Thu, 30 Jan 2020 15:38:16 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] lib/igt_kms: Add igt_reduce_format()
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDIwLTAxLTMwIDE1OjEyOjI4KQo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gQWRkIGEgaGVs
cGVyIHRvIHJlZHVjZSBhIHBpeGVsIGZvcm1hdCB0byBhICJiYXNlIiBmb3JtYXQuCj4gSWUuIGdy
b3VwIGFsbCBmb3JtYXRzIHRvIHNvbWUgaWRlYSBvZiBjbGFzc2VzIGJhc2VkIG9uIHRoZQo+IGJp
dHMgcGVyIHBpeGVsICsgY29tcG9uZW50IHNpemVzIGV0Yy4gaWdub3JpbmcgYW55IGNvbXBvbmVu
dCBvcmRlcmluZy4KPiBMZXQncyB1cyBza2lwIHBvdGVudGlhbGx5IHJlZHVuZGFudCB0ZXN0cyB3
aGVuIGFsbCB3ZSBtaWdodCBjYXJlCj4gYWJvdXQgaXMgdGVzdGluZyBlYWNoIGZvcm1hdCAiY2xh
c3MiIHRoZSBvbmNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUu
c3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gLS0tCj4gIGxpYi9pZ3Rfa21zLmMgfCA3OSArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgbGliL2ln
dF9rbXMuaCB8ICAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCA4MCBpbnNlcnRpb25zKCspCj4gCj4g
ZGlmZiAtLWdpdCBhL2xpYi9pZ3Rfa21zLmMgYi9saWIvaWd0X2ttcy5jCj4gaW5kZXggZDIwZGFh
YWQ3NzY0Li4yYjA3NWM0MzUyOTEgMTAwNjQ0Cj4gLS0tIGEvbGliL2lndF9rbXMuYwo+ICsrKyBi
L2xpYi9pZ3Rfa21zLmMKPiBAQCAtNDQ3NCwzICs0NDc0LDgyIEBAIHZvaWQgaWd0X3BhcnNlX2Nv
bm5lY3Rvcl90aWxlX2Jsb2IoZHJtTW9kZVByb3BlcnR5QmxvYlB0ciBibG9iLAo+ICAgICAgICAg
dGlsZS0+dGlsZV9oX3NpemUgPSBhdG9pKHN0cnRvayhOVUxMLCAiOiIpKTsKPiAgICAgICAgIHRp
bGUtPnRpbGVfdl9zaXplID0gYXRvaShzdHJ0b2soTlVMTCwgIjoiKSk7Cj4gIH0KPiArCj4gK3Vp
bnQzMl90IGlndF9yZWR1Y2VfZm9ybWF0KHVpbnQzMl90IGZvcm1hdCkKPiArewoKLyoKICogQW55
IHdvcmRzIG9mIHdpc2RvbSBvbiBob3cvd2h5IHRoZXNlIGFyZSByZWR1Y2VkIHRvIGEgcmVwcmVz
ZW50YXRpdmUKICogZm9ybWF0IGZvciBlYWNoIGNsYXNzPyBKdXN0IGluIGNhc2UgYSBuZXcgZm9y
bWF0IGlzIGludHJvZHVjZWQgYW5kIHdlCiAqIHdhbnQgdG8gZGVjaWRlIGlmIGl0J3MgYSBuZXcg
Y2xhc3Mgb3Igc2hvdWxkIGJlIGFsaWFzZWQgdG8gYW4gb2xkZXIKICogb25lLgogKi8KPiArICAg
ICAgIHN3aXRjaCAoZm9ybWF0KSB7Cj4gKyAgICAgICBjYXNlIERSTV9GT1JNQVRfUkdCMzMyOgo+
ICsgICAgICAgY2FzZSBEUk1fRk9STUFUX0JHUjIzMzoKPiArICAgICAgICAgICAgICAgcmV0dXJu
IERSTV9GT1JNQVRfUkdCMzMyOwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXYK
