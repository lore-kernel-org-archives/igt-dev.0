Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2176E480
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Dec 2019 11:38:07 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191203111537.23389-1-petri.latvala@intel.com>
References: <20191203104457.20176-2-petri.latvala@intel.com>
 <20191203111537.23389-1-petri.latvala@intel.com>
Message-ID: <157537307499.7230.10998969344052479241@skylake-alporthouse-com>
Date: Tue, 03 Dec 2019 11:37:55 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] runner: Don't wait forever for
 processes to die
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBQZXRyaSBMYXR2YWxhICgyMDE5LTEyLTAzIDExOjE1OjM3KQo+IFdoaWxlIHRoZSBv
cmlnaW5hbGx5IHdyaXR0ZW4gdGltZW91dCBmb3IgcHJvY2VzcyBraWxsaW5nICgyIHNlY29uZHMp
Cj4gd2FzIHdheSB0b28gc2hvcnQsIHdhaXRpbmcgaW5kZWZpbml0ZWx5IGlzIHN1Ym9wdGltYWwg
YXMgd2VsbC4gV2UncmUKPiBzZWVpbmcgY2FzZXMgd2hlcmUgdGhlIHRlc3QgaXMgc3R1Y2sgZm9y
IHBvc3NpYmx5IGhvdXJzIGluCj4gdW5pbnRlcnJ1cHRpYmxlIHNsZWVwIChJTykuIFdhaXQgYSBm
YWlybHkgbG9uZ2VyIHNlbGVjdGVkIHRpbWUgcGVyaW9kCj4gb2YgMiBtaW51dGVzLCBiZWNhdXNl
IGV2ZW4gbWFraW5nIHByb2dyZXNzIGZvciB0aGF0IGxvbmcgbWVhbnMgdGhlCj4gbWFjaGluZSBp
cyBpbiBiYWQgZW5vdWdoIHN0YXRlIHRvIHJlcXVpcmUgYSBnb29kIGtpY2tpbmcgYW5kIGJvb3Rp
bmcuCj4gCj4gdjI6Cj4gIC0gQWJvcnQgcXVpY2tlciBpZiBrZXJuZWwgaXMgdGFpbnRlZCAoQ2hy
aXMpCj4gIC0gQ29ycmVjdGx5IGNvbnZlcnQgcHJvY2Vzcy1leGlzdHMgY2hlY2sgd2l0aCBraWxs
KCkgdG8gcHJvY2Vzcy1kb2VzLW5vdC1leGlzdAo+IAo+IFNpZ25lZC1vZmYtYnk6IFBldHJpIExh
dHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgo+IENjOiBDaHJpcyBXaWxzb24gPGNocmlz
QGNocmlzLXdpbHNvbi5jby51az4KPiBDYzogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGls
ZXJAaW50ZWwuY29tPgoKUmVhZHMgbGlrZSBpdCBkb2VzIHdoYXQgeW91IHNheSBvbiB0aGUgdGlu
LgpSZXZpZXdlZC1ieSBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+
Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
