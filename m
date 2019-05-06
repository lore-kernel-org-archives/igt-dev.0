Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5227890F9
 for <igt-dev@lists.freedesktop.org>; Mon,  6 May 2019 05:24:40 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
Date: Mon,  6 May 2019 10:40:07 +0530
Message-Id: <1557119408-9293-1-git-send-email-karthik.b.s@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_cursor_crc: Limit cursor size
 based
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
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

TGltaXRpbmcgdGhlIG1heGltdW0gY3Vyc29yIHNpemUgYmVpbmcgdXNlZCBpbiBzdWJ0ZXN0cyBi
YXNlZCBvbiBwbGF0Zm9ybQpjYXBhYmlsaXR5LCB0byBhdm9pZCBza2lwcGluZyBvZiBzdWJ0ZXN0
cy4KCkthcnRoaWsgQiBTICgxKToKICB0ZXN0cy9rbXNfY3Vyc29yX2NyYzogTGltaXQgY3Vyc29y
IHNpemUgYmFzZWQgb24gcGxhdGZvcm0gY2FwYWJpbGl0eS4KCiB0ZXN0cy9rbXNfY3Vyc29yX2Ny
Yy5jIHwgMTAyICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspLCA1MyBkZWxldGlvbnMoLSkKCi0t
IAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
