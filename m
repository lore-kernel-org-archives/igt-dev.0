Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170A88808E
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2019 15:47:28 +0000 (UTC)
Date: Wed, 5 Jun 2019 18:47:23 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20190605154723.5kl2vm6ftmpb4ys6@ahiler-desk1.fi.intel.com>
References: <20190605103627.32526-1-simon.ser@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190605103627.32526-1-simon.ser@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_chamelium: wait for worker
 thread to finish
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
To: Simon Ser <simon.ser@intel.com>
Cc: igt-dev@lists.freedesktop.org, martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBKdW4gMDUsIDIwMTkgYXQgMDE6MzY6MjdQTSArMDMwMCwgU2ltb24gU2VyIHdyb3Rl
Ogo+IFdoZW5ldmVyIHdlIGNoYW5nZSBhIHBpcGUncyByZXNvbHV0aW9uLCB3ZSBuZWVkIHRvIHBl
cmZvcm0gYSBGU00gb24gdGhlCj4gQ2hhbWVsaXVtOiB0aGUgdmlkZW8gcmVjZWl2ZXIgd2lsbCBi
ZSByZXN0YXJ0ZWQgYW5kIHRoZSBDaGFtZWxpdW0gZGV2aWNlIHdpbGwKPiBzZW5kIGEgaG90cGx1
ZyBldmVudC4gQWxsIG9mIHRoaXMgaGFwcGVucyBkdXJpbmcgdGhlIFhNTC1SUEMgY2FsbC4KPiAK
PiBUbyBoYW5kbGUgdGhlIGhvdHBsdWcgZXZlbnQsIHdlIHN0YXJ0IGEgbmV3IHRocmVhZCAoYW5k
IGV4ZWN1dGUgdGhlIFhNTC1SUEMKPiByZXF1ZXN0IGluIHRoZSBtYWluIHRocmVhZCBpbiBhIGJs
b2NraW5nIGZhc2hpb24pLiBTb21lIHN0YXRlIGlzIGFzc29jaWF0ZWQKPiB3aXRoIHRoZSBob3Rw
bHVnIHRocmVhZCBhbmQgc3RvcmVkIGluIGZzbV9tb25pdG9yX2FyZ3MuIFdlIGluaXRpYWxpemUg
dGhpcwo+IHN0YXRlIGJlZm9yZSBzdGFydGluZyB0aGUgdGhyZWFkLCBhbmQgcGVyZm9ybSBjbGVh
bnVwIGFmdGVyIGNhbmNlbGxpbmcgaXQuCj4gCj4gSG93ZXZlciBwdGhyZWFkX2NhbmNlbCBpcyBh
c3luY2hyb25vdXM6IGl0IG1lcmVseSBxdWV1ZXMgYSBjYW5jZWxsYXRpb24gcmVxdWVzdAo+IGZv
ciB0aGUgdGhyZWFkLiBUaHVzIGNsZWFuaW5nIHVwIGFmdGVyIHB0aHJlYWRfY2FuY2VsIGlzIHJh
Y3k6IHRoZSB0aHJlYWQgbWlnaHQKPiBzdGlsbCBiZSBydW5uaW5nIGFuZCB1c2luZyBmc21fbW9u
aXRvcl9hcmdzLm1vbi4gU2luY2UgdGhpcyBpcyBzaGFyZWQgbWVtb3J5LAo+IHRoaXMgY2FuIGxl
YWQgdG8gc2VnbWVudGF0aW9uIGZhdWx0cyBvciBzdHJhbmdlIGJlaGF2aW91ci4KPiAKPiBUaGlz
IGNvbW1pdCBmaXhlcyB0aGUgcmFjZSBieSBjYWxsaW5nIHB0aHJlYWRfam9pbiBiZWZvcmUgY2xl
YW5pbmcgdXAgdGhlCj4gc3RhdGUuIFRoaXMgZW5zdXJlcyB0aGF0IGVpdGhlciB0aGUgdGhyZWFk
IGhhcyBiZWVuIHN1Y2Nlc3NmdWxseSBjYW5jZWxsZWQsCj4gZWl0aGVyIGl0IGhhcyB0ZXJtaW5h
dGVkLgo+IAo+IFRoaXMgaXMgYW4gYXR0ZW1wdCB0byBmaXggdGhpcyBidWc6Cj4gaHR0cHM6Ly9i
dWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTEwNzMwCj4gCj4gU2lnbmVkLW9m
Zi1ieTogU2ltb24gU2VyIDxzaW1vbi5zZXJAaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogQXJrYWRp
dXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29tPgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2lndC1kZXY=
