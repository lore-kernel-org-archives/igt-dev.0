Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC0D89D7D
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Mar 2018 08:57:04 +0000 (UTC)
Date: Thu, 8 Mar 2018 10:57:00 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20180308085700.GA22044@ahiler-desk1.ger.corp.intel.com>
References: <20180227085232.54025-1-maarten.lankhorst@linux.intel.com>
 <20180227085232.54025-4-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180227085232.54025-4-maarten.lankhorst@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 3/4] tests/kms_frontbuffer_tracking:
 Convert test to use igt_display, v3.
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBGZWIgMjcsIDIwMTggYXQgMDk6NTI6MzFBTSArMDEwMCwgTWFhcnRlbiBMYW5raG9y
c3Qgd3JvdGU6Cj4gU3RyYWlnaHQgY29udmVyc2lvbiwgbm8gYmVoYXZpb3JhbCBjaGFuZ2VzIHll
dC4KPiAKPiBDaGFuZ2VzIHNpbmNlIHYxOgo+IC0gSGFuZGxlIDJ4IG91dHB1dHMgY29ycmVjdGx5
Lgo+IENoYW5nZXMgc2luY2UgdjI6Cj4gLSBTZXQgY29ycmVjdCBwYXJhbWV0ZXJzIGluIHNldF9t
b2RlX2Zvcl9wYXJhbXMsIHNvIGF0b21pYyBjb21taXQgZm9yCj4gICAyeCBvdXRwdXRzIGRvZXNu
J3Qgc2NhbGUuCj4gLSBGaXggYWNjaWRlbnRhbCBzY2FsaW5nIGluIHNldF9wcmltX3BsYW5lX2Zv
cl9wYXJhbXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4u
bGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KCkNJIHJlc3VsdHMgYXJlIGNsZWFuIGZvciB0aGUg
Y29udmVyc2lvbiwgc286ClJldmlld2VkLWJ5OiBBcmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5o
aWxlckBpbnRlbC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
