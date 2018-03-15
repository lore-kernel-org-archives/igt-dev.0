Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm0-x244.google.com (mail-wm0-x244.google.com
 [IPv6:2a00:1450:400c:c09::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C326E7EB
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Mar 2018 10:01:33 +0000 (UTC)
Received: by mail-wm0-x244.google.com with SMTP id z9so9216527wmb.3
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Mar 2018 03:01:33 -0700 (PDT)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Thu, 15 Mar 2018 10:01:22 +0000
Message-Id: <20180315100122.10336-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20180305124158.22793-1-tvrtko.ursulin@linux.intel.com>
References: <20180305124158.22793-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t v2] intel-gpu-overlay: Update for renamed
 tracepoints
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KClJlcXVlc3Qg
dHJhY2Vwb2ludHMgaGF2ZSBiZWVuIHJlbmFtZXMgc28gdXBkYXRlIHRoZSB0b29sIHRvIGJlIGFi
bGUgdG8KZmluZCB0aGVtLgoKdjI6IE9ubHkgc3VwcG9ydCBuZXcgbmFtZXMuCgpTaWduZWQtb2Zm
LWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgotLS0KIG92ZXJs
YXkvZ3B1LXBlcmYuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL292ZXJsYXkvZ3B1LXBlcmYuYyBiL292ZXJs
YXkvZ3B1LXBlcmYuYwppbmRleCAwYWJkOTM3ZTM2MTguLmVhMzQ4MDA1MGFiOSAxMDA2NDQKLS0t
IGEvb3ZlcmxheS9ncHUtcGVyZi5jCisrKyBiL292ZXJsYXkvZ3B1LXBlcmYuYwpAQCAtOTAsOSAr
OTAsOSBAQCBzdHJ1Y3QgdHJhY2Vwb2ludCB7CiAJaW50IGdsb2JhbF9zZXFub19maWVsZDsKIAlp
bnQgcGxhbmVfZmllbGQ7CiB9IHRyYWNlcG9pbnRzW1RQX05CXSA9IHsKLQlbVFBfR0VNX1JFUVVF
U1RfQUREXSAgICAgICAgID0geyAubmFtZSA9ICJpOTE1L2k5MTVfZ2VtX3JlcXVlc3RfYWRkIiwg
fSwKLQlbVFBfR0VNX1JFUVVFU1RfV0FJVF9CRUdJTl0gID0geyAubmFtZSA9ICJpOTE1L2k5MTVf
Z2VtX3JlcXVlc3Rfd2FpdF9iZWdpbiIsIH0sCi0JW1RQX0dFTV9SRVFVRVNUX1dBSVRfRU5EXSAg
ICA9IHsgLm5hbWUgPSAiaTkxNS9pOTE1X2dlbV9yZXF1ZXN0X3dhaXRfZW5kIiwgfSwKKwlbVFBf
R0VNX1JFUVVFU1RfQUREXSAgICAgICAgID0geyAubmFtZSA9ICJpOTE1L2k5MTVfcmVxdWVzdF9h
ZGQiLCB9LAorCVtUUF9HRU1fUkVRVUVTVF9XQUlUX0JFR0lOXSAgPSB7IC5uYW1lID0gImk5MTUv
aTkxNV9yZXF1ZXN0X3dhaXRfYmVnaW4iLCB9LAorCVtUUF9HRU1fUkVRVUVTVF9XQUlUX0VORF0g
ICAgPSB7IC5uYW1lID0gImk5MTUvaTkxNV9yZXF1ZXN0X3dhaXRfZW5kIiwgfSwKIAlbVFBfRkxJ
UF9DT01QTEVURV0gICAgICAgICAgID0geyAubmFtZSA9ICJpOTE1L2ZsaXBfY29tcGxldGUiLCB9
LAogCVtUUF9HRU1fUklOR19TWU5DX1RPXSAgICAgICAgPSB7IC5uYW1lID0gImk5MTUvZ2VtX3Jp
bmdfc3luY190byIsIH0sCiAJW1RQX0dFTV9SSU5HX1NXSVRDSF9DT05URVhUXSA9IHsgLm5hbWUg
PSAiaTkxNS9nZW1fcmluZ19zd2l0Y2hfY29udGV4dCIsIH0sCi0tIAoyLjE0LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
