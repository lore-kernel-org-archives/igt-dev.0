Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03906EA67
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2020 21:22:21 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Wed, 15 Apr 2020 14:24:06 -0700
Message-Id: <20200415212406.102082-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tools/registers/tgl: Fix tigerlake_delta
 file decode
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

SXQgd2FzIG1pc3NpbmcgYSAiKSIgdG8gYmUgcHJvcGVybHkgcGFyc2VkLgoKU2lnbmVkLW9mZi1i
eTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+Ci0tLQogdG9v
bHMvcmVnaXN0ZXJzL3RpZ2VybGFrZV9kZWx0YS50eHQgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90b29scy9yZWdpc3Rl
cnMvdGlnZXJsYWtlX2RlbHRhLnR4dCBiL3Rvb2xzL3JlZ2lzdGVycy90aWdlcmxha2VfZGVsdGEu
dHh0CmluZGV4IGU4MjA0OWI5OS4uYzdmYzJkYzI0IDEwMDY0NAotLS0gYS90b29scy9yZWdpc3Rl
cnMvdGlnZXJsYWtlX2RlbHRhLnR4dAorKysgYi90b29scy9yZWdpc3RlcnMvdGlnZXJsYWtlX2Rl
bHRhLnR4dApAQCAtMTEwLDcgKzExMCw3IEBACiAoJ1BMQU5FX0NPTE9SX0NUTF81X0QnLCAnMHg3
MzVjYycsICcnKQogKCdQTEFORV9DT0xPUl9DVExfNl9EJywgJzB4NzM2Y2MnLCAnJykKICgnUExB
TkVfQ09MT1JfQ1RMXzdfRCcsICcweDczN2NjJywgJycpCi0oJ1BMQU5FX09GRlNFVF8xX0QnLCAn
MHg3MzFhNCcsICcnCisoJ1BMQU5FX09GRlNFVF8xX0QnLCAnMHg3MzFhNCcsICcnKQogKCdQTEFO
RV9PRkZTRVRfMl9EJywgJzB4NzMyYTQnLCAnJykKICgnUExBTkVfT0ZGU0VUXzNfRCcsICcweDcz
M2E0JywgJycpCiAoJ1BMQU5FX09GRlNFVF80X0QnLCAnMHg3MzRhNCcsICcnKQotLSAKMi4yNi4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
