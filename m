Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9906E1C0
 for <igt-dev@lists.freedesktop.org>; Tue, 15 May 2018 07:45:42 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20180514113722.28594-1-katarzyna.dec@intel.com>
 <20180514125155.19040-1-katarzyna.dec@intel.com>
In-Reply-To: <20180514125155.19040-1-katarzyna.dec@intel.com>
Message-ID: <152637033638.18532.13629251602562987807@mail.alporthouse.com>
Date: Tue, 15 May 2018 08:45:36 +0100
Subject: Re: [igt-dev] [PATCH i-g-t v3] lib/igt_device: Add information why
 cannot drop drm master
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
To: Katarzyna Dec <katarzyna.dec@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBLYXRhcnp5bmEgRGVjICgyMDE4LTA1LTE0IDEzOjUxOjU1KQo+IExldCdzIGFkZCBh
ZGRpdGlvbmFsIGluZm9ybWF0aW9uIHRvIGlndF9kZXZpY2VfZHJvcF9tYXN0ZXIKPiBpbiBjYXNl
IHdlIHRyeSB0byBydW4gdGVzdHMgd2l0aCBlLmcuIHgxMSBlbmFibGVkLgo+IAo+IHYyOiBDaGFu
Z2VkIGNvbW1lbnQgYW5kIGFkZGVkIGxpc3RpbmcgY2xpZW50cy4KPiB2MzogQ2hhbmdlZCBpZ3Rf
cmVxdWlyZSB0byBpZ3RfYXNzZXJ0Cj4gCj4gU2lnbmVkLW9mZi1ieTogS2F0YXJ6eW5hIERlYyA8
a2F0YXJ6eW5hLmRlY0BpbnRlbC5jb20+Cj4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMt
d2lsc29uLmNvLnVrPgo+IC0tLQo+ICBsaWIvaWd0X2RldmljZS5jIHwgNiArKysrKy0KPiAgMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS9saWIvaWd0X2RldmljZS5jIGIvbGliL2lndF9kZXZpY2UuYwo+IGluZGV4IDhhMmRkMGUz
Li43MTM1ZmMyMCAxMDA2NDQKPiAtLS0gYS9saWIvaWd0X2RldmljZS5jCj4gKysrIGIvbGliL2ln
dF9kZXZpY2UuYwo+IEBAIC03NCw1ICs3NCw5IEBAIGludCBfX2lndF9kZXZpY2VfZHJvcF9tYXN0
ZXIoaW50IGZkKQo+ICAgKi8KPiAgdm9pZCBpZ3RfZGV2aWNlX2Ryb3BfbWFzdGVyKGludCBmZCkK
PiAgewoKSSB0aGluayB0aGVyZSdzIHN0aWxsIHJvb20gZm9yIGEgCgoJLyogQ2hlY2sgaWYgd2Ug
YXJlIG1hc3RlciBiZWZvcmUgZHJvcHBpbmcgKi8KCWlmIChfX2lndF9kZXZpY2Vfc2V0X21hc3Rl
cihmZCkpCgkJcmV0dXJuOwoKdXBmcm9udCBzbyB0aGF0IHdlIG9ubHkgZHJvcCBtYXN0ZXIgd2hl
biBtYXN0ZXIgdGhlbiB0aGUgbXlzdGVyeSBmYWlscwpqdXN0IG5ldmVyIGhhcHBlbi4KCj4gLSAg
ICAgICBpZ3RfYXNzZXJ0X2VxKF9faWd0X2RldmljZV9kcm9wX21hc3RlcihmZCksIDApOwo+ICsg
ICAgICAgaWYgKF9faWd0X2RldmljZV9kcm9wX21hc3RlcihmZCkpIHsKPiArICAgICAgICAgICAg
ICAgaWd0X2RlYnVnZnNfZHVtcChmZCwgImNsaWVudHMiKTsKPiArICAgICAgICAgICAgICAgaWd0
X2Fzc2VydF9mKF9faWd0X2RldmljZV9kcm9wX21hc3RlcihmZCkgPT0gMCwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAiRmFpbGVkIHRvIGRyb3AgRFJNIG1hc3Rlci5cbiIpOwo+ICsg
ICAgICAgfQo+ICB9CgpSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxz
b24uY28udWs+Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
