Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD901891D1
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2019 09:44:55 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190411094012.4288-1-petri.latvala@intel.com>
References: <20190411094012.4288-1-petri.latvala@intel.com>
Message-ID: <155497588502.28388.7426589132385422250@skylake-alporthouse-com>
Date: Thu, 11 Apr 2019 10:44:45 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Make sure oom-killer doesn't
 kill the runner
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

UXVvdGluZyBQZXRyaSBMYXR2YWxhICgyMDE5LTA0LTExIDEwOjQwOjEyKQo+IFRlc3RzIHRoYXQg
ZWF0IGFsbCBvZiB0aGUgUkFNIGFuZCB0aGVuIHNvbWUgdG8gaW52b2tlIHRoZSBvb20ta2lsbGVy
Cj4gZGVsaWJlcmF0ZWx5IHNvbWV0aW1lcyBjYXVzZSBleHRyYSBjYXN1YWx0aWVzLiBNYWtlIHN1
cmUgdGhlIHJ1bm5lcgo+IHN0YXlzIGFsaXZlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBldHJpIExh
dHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29u
IDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXY=
