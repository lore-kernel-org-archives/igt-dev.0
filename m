Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66AFD6E80C
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Apr 2018 19:30:41 +0000 (UTC)
Message-ID: <1522956624.2748.16.camel@intel.com>
From: Paulo Zanoni <paulo.r.zanoni@intel.com>
Date: Thu, 05 Apr 2018 12:30:24 -0700
In-Reply-To: <1ec07ec3-8f39-bbf2-9a3d-02746040e9b9@linux.intel.com>
References: <20180227085232.54025-1-maarten.lankhorst@linux.intel.com>
 <20180227085232.54025-5-maarten.lankhorst@linux.intel.com>
 <c2d5541a-6dd5-b962-fe25-82a9898dd536@linux.intel.com>
 <1521661661.3150.13.camel@intel.com> <1522945862.2748.4.camel@intel.com>
 <1ec07ec3-8f39-bbf2-9a3d-02746040e9b9@linux.intel.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 4/4] tests/kms_frontbuffer_tracking:
 Remove redundant modesets during subtest start.
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

RW0gUXVpLCAyMDE4LTA0LTA1IMOgcyAyMToyMSArMDIwMCwgTWFhcnRlbiBMYW5raG9yc3QgZXNj
cmV2ZXU6Cj4gT3AgMDUtMDQtMTggb20gMTg6MzEgc2NocmVlZiBQYXVsbyBaYW5vbmk6Cj4gPiBF
bSBRdWEsIDIwMTgtMDMtMjEgw6BzIDEyOjQ3IC0wNzAwLCBQYXVsbyBaYW5vbmkgZXNjcmV2ZXU6
Cj4gPiA+IEVtIFF1aSwgMjAxOC0wMy0wMSDDoHMgMTY6MzMgKzAxMDAsIE1hYXJ0ZW4gTGFua2hv
cnN0IGVzY3JldmV1Ogo+ID4gPiA+IEhleSwKPiA+ID4gPiAKPiA+ID4gPiBPcCAyNy0wMi0xOCBv
bSAwOTo1MiBzY2hyZWVmIE1hYXJ0ZW4gTGFua2hvcnN0Ogo+ID4gPiA+ID4gQ1JDIGNhcHR1cmlu
ZyBlbmFibGVzIHRoZSBkaXNwbGF5LCB0aGVuIGRpc2FibGVzIGl0IGFnYWluLgo+ID4gPiA+ID4g
V2l0aAo+ID4gPiA+ID4gaWd0X2Rpc3BsYXkgd2UgY2FuIHVzZSBpZ3RfZGlzcGxheV9yZXNldCB0
byByZXN0b3JlIHRoZQo+ID4gPiA+ID4gb3JpZ2luYWwKPiA+ID4gPiA+IHN0YXRlLAo+ID4gPiA+
ID4gd2l0aG91dCBjb21taXR0aW5nIGl0IHRvIHRoZSBody4KPiA+ID4gPiA+IAo+ID4gPiA+ID4g
QWxsIHN1YnRlc3RzIGZpcnN0IHNldCB0aGVpciBvd24gc3RhdGUgYW55d2F5LCBzbyB3ZSBjYW4g
c2F2ZQo+ID4gPiA+ID4gdXAKPiA+ID4gPiA+IG9uCj4gPiA+ID4gPiB0aGUgbnVtYmVyIG9mIGNv
bW1pdHMuCj4gPiA+ID4gCj4gPiA+ID4gSSBwYXRjaGVkIGlndF9rbXMgdG8gcmVwb3J0IHRoZSBu
dW1iZXIgb2YgbW9kZXNldHMuLgo+ID4gPiA+IAo+ID4gPiA+IFdpdGhvdXQgdGhpcyBwYXRjaCBy
dW5uaW5nIC4va21zX2Zyb250YnVmZmVyX3RyYWNraW5nIG9uIGEgMgo+ID4gPiA+IG91dHB1dAo+
ID4gPiA+IHN5c3RlbSAoZjItc25iLTI2MDAsIGZvcmNlZCBWR0EtMSBlbmFibGVkKToKPiA+ID4g
PiBQZXJmb3JtZWQgMzgyIG1vZGVzZXRzCj4gPiA+ID4gCj4gPiA+ID4gV2l0aCB0aGlzIHBhdGNo
IG9uIGEgMiBvdXRwdXQgc3lzdGVtOgo+ID4gPiA+IFBlcmZvcm1lZCAyMyBtb2Rlc2V0cwo+ID4g
PiA+IAo+ID4gPiA+IE9uIGdlbWluaWxha2UgdGhpcyBtZWFucyB3ZSBzYXZlIGEgbG90IG9mIHRp
bWUsIHNvIGNvdWxkCj4gPiA+ID4gc29tZW9uZQo+ID4gPiA+IHJldmlldyB0aGlzIHNlcmllcz8K
PiA+ID4gCj4gPiA+IElzIHRoZXJlIGFuIGFuYWx5c2lzIG9uIGhvdyByZWR1Y2luZyB0aGUgYW1v
dW50IG9mIG1vZGVzZXRzIHdpbGwKPiA+ID4gKm5vdCoKPiA+ID4gaW52YWxpZGFkZSB0aGUgcHVy
cG9zZSBvZiB0aGUgdGVzdHM/IFRoZSBtb2Rlc2V0cyBhcmUgdGhlcmUgZm9yIGEKPiA+ID4gcmVh
c29uLgo+ID4gCj4gPiBQaW5nPwo+IAo+IEhvdyB3aWxsIGRvaW5nIGEgbW9kZXNldCBpbXByb3Zl
IHRoZSB0ZXN0Pwo+IAo+IFdlIHByZXNlcnZlIHRoZSBtb2RlIG9ubHkgaWYgaXQgbWFrZXMgc2Vu
c2UsIGVhY2ggc3VidGVzdCBzZXRzIHRoZQo+IHBhcmFtZXRlcnMgaXQgd2FudHMuIEl0IGp1c3Qg
aGFwcGVucyB0aGF0IGluIG1vc3QgY2FzZXMgdGhhdCdzIHRoZQo+IHNhbWUgbW9kZSwgc28gd2Ug
ZG9uJ3QgaGF2ZSB0byBkbyBhIG1vZGVzZXQuCj4gVGhhdCdzIGFsbC4gOikKCkJ1dCBoYXZpbmcg
b3Igbm90IGhhdmluZyBhIG1vZGVzZXQsIGhhdmluZyBvciBub3QgaGF2aW5nIGEgZmxpcCBjaGFu
Z2VzCmhvdyB0aGUgRkJDIGNvZGUgaW4gdGhlIEtlcm5lbCBiZWhhdmVzLiBTbyBjaGFuZ2luZyBm
cm9tIGhhdmluZyBhCm1vZGVzZXQgdG8gbm90IGhhdmluZyBvbmUgd2lsbCBkZWZpbml0ZWx5IGhh
dmUgYW4gaW1wYWN0IG9uIHdoYXQgY29kZQpnZXRzIHJ1bi4gSXQgd291bGQgYmUgZ29vZCB0byBo
YXZlIGEgZGV0YWlsZWQgYW5hbHlzaXMgb24gd2h5IHRoaXMgaXMKbm90IHRoZSBjYXNlIHRoZSBz
cGVjaWZpYyBwb2ludHMgdGhhdCBjaGFuZ2VkLgoKPiAKPiB+TWFhcnRlbgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdApp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
