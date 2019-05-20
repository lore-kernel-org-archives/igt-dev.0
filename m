Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6121689238
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2019 18:39:37 +0000 (UTC)
From: Antonio Argenziano <antonio.argenziano@intel.com>
Date: Mon, 20 May 2019 11:39:07 -0700
Message-Id: <20190520183907.8643-1-antonio.argenziano@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/igt.h: Guard igt_alsa.h in
 HAVE_CHAMELIUM guard
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

VGhlIGFsc2EgbGlicmFyeSBpcyBvbmx5IGd1YXJhbnRlZWQgdG8gZXhpc3RzIGlzIHRoZSBIQVZF
X0NIQU1FTElVTSBmbGFnCmlzIHNldC4KClNpZ25lZC1vZmYtYnk6IEFudG9uaW8gQXJnZW56aWFu
byA8YW50b25pby5hcmdlbnppYW5vQGludGVsLmNvbT4KQ2M6IFNpbW9uIFNlciA8c2ltb24uc2Vy
QGludGVsLmNvbT4KLS0tCiBsaWIvaWd0LmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9saWIvaWd0LmggYi9saWIvaWd0
LmgKaW5kZXggNTg1MmQ1NTcuLjJhZTQzYzMwIDEwMDY0NAotLS0gYS9saWIvaWd0LmgKKysrIGIv
bGliL2lndC5oCkBAIC0zNSwxMyArMzUsMTMgQEAKICNpbmNsdWRlICJpZ3RfZHVtbXlsb2FkLmgi
CiAjaW5jbHVkZSAiaWd0X2ZiLmgiCiAjaW5jbHVkZSAiaWd0X2ZyYW1lLmgiCi0jaW5jbHVkZSAi
aWd0X2Fsc2EuaCIKICNpbmNsdWRlICJpZ3RfYXVkaW8uaCIKICNpbmNsdWRlICJpZ3RfZ3QuaCIK
ICNpbmNsdWRlICJpZ3Rfa21zLmgiCiAjaW5jbHVkZSAiaWd0X3BtLmgiCiAjaW5jbHVkZSAiaWd0
X3N0YXRzLmgiCiAjaWZkZWYgSEFWRV9DSEFNRUxJVU0KKyNpbmNsdWRlICJpZ3RfYWxzYS5oIgog
I2luY2x1ZGUgImlndF9jaGFtZWxpdW0uaCIKICNpbmNsdWRlICJpZ3RfY2hhbWVsaXVtX3N0cmVh
bS5oIgogI2VuZGlmCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldg==
