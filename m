Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B0089B99
 for <igt-dev@lists.freedesktop.org>; Fri, 10 May 2019 14:45:53 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l2so8222544wrb.9
 for <igt-dev@lists.freedesktop.org>; Fri, 10 May 2019 07:45:53 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Date: Fri, 10 May 2019 16:44:58 +0200
Message-Id: <20190510144458.20113-6-tomeu.vizoso@collabora.com>
In-Reply-To: <20190510144458.20113-1-tomeu.vizoso@collabora.com>
References: <20190510144458.20113-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 6/6] panfrost: Don't check for automake
 support
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
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Cc: Petri Latvala <petri.latvala@intel.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
List-ID: <igt-dev@lists.freedesktop.org>

T25seSB0aGUgbWVzb24gYnVpbGQgc3VwcG9ydHMgUGFuZnJvc3QuCgpTaWduZWQtb2ZmLWJ5OiBU
b21ldSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPgpBY2tlZC1ieTogUGV0cmkg
TGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Ci0tLQogLmdpdGxhYi1jaS55bWwgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS8uZ2l0bGFiLWNpLnltbCBiLy5naXRsYWItY2kueW1sCmluZGV4IDI1OTBlNjVmNjg4
OC4uOWZlNmE4ZjYxM2E2IDEwMDY0NAotLS0gYS8uZ2l0bGFiLWNpLnltbAorKysgYi8uZ2l0bGFi
LWNpLnltbApAQCAtMTUwLDcgKzE1MCw3IEBAIHRlc3Q6dGVzdC1saXN0LWRpZmY6CiAgICAgLSBi
dWlsZDp0ZXN0cy1kZWJpYW4tYXV0b3Rvb2xzCiAgICAgLSBidWlsZDp0ZXN0cy1kZWJpYW4tbWVz
b24KICAgc3RhZ2U6IHRlc3QKLSAgc2NyaXB0OiBkaWZmIDwoc2VkICJzLyAvXG4vZyIgbWVzb24t
dGVzdC1saXN0LnR4dHwgZ3JlcCAtdiAndmM0XHx2M2QnIHwgc29ydCkgPChzZWQgInMvIC9cbi9n
IiBhdXRvdG9vbHMtdGVzdC1saXN0LnR4dCB8IHNvcnQpCisgIHNjcmlwdDogZGlmZiA8KHNlZCAi
cy8gL1xuL2ciIG1lc29uLXRlc3QtbGlzdC50eHR8IGdyZXAgLXYgJ3ZjNFx8djNkXHxwYW5mcm9z
dCcgfCBzb3J0KSA8KHNlZCAicy8gL1xuL2ciIGF1dG90b29scy10ZXN0LWxpc3QudHh0IHwgc29y
dCkKIAogIyMjIyMjIyMjIyMjIyMjIyMjIyBERVBMT1kgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
