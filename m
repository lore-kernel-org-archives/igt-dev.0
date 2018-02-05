Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D4789DBA
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Feb 2018 09:40:44 +0000 (UTC)
From: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
Date: Mon,  5 Feb 2018 11:35:19 +0200
Message-Id: <1517823325-26678-1-git-send-email-abdiel.janulgue@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t] Move some gem tests to benchmarks
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
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

U29tZSBvZiB0aGUgZ2VtIHRlc3RzIGFjdHVhbGx5IGxvb2sgbGlrZSBiZW5jaG1hcmtzLiBNb3Zl
IHRoZW0gdG8gdGhlaXIKcHJvcGVyIHBsYWNlLiBBbHNvIGltcHJvdmUgZ2VtX2d0dF9zcGVlZCBi
eSBhZGRpbmcgYSBwb3N0LXN1c3BlbmQKYmVuY2htYXJrLgoKQ2M6IEpvb25hcyBMYWh0aW5lbiA8
am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbT4KQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNA
Y2hyaXMtd2lsc29uLmNvLnVrPgoKIGJlbmNobWFya3MvTWFrZWZpbGUuc291cmNlcyAgICAgIHwg
ICA1ICsKIGJlbmNobWFya3MvZ2VtX2V4ZWNfbGF0ZW5jeS5jICAgIHwgNTA0ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKIGJlbmNobWFya3MvZ2VtX2V4ZWNfbHV0X2hhbmRsZS5j
IHwgMjYzICsrKysrKysrKysrKysrKysrKwogYmVuY2htYXJrcy9nZW1fZmVuY2VfdXBsb2FkLmMg
ICAgfCA0MDUgKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBiZW5jaG1hcmtzL2dlbV9ndHRf
c3BlZWQuYyAgICAgICB8IDU0MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
CiBiZW5jaG1hcmtzL2dlbV9yZWFkX3JlYWRfc3BlZWQuYyB8IDIxMyArKysrKysrKysrKysrKysK
IGJlbmNobWFya3MvbWVzb24uYnVpbGQgICAgICAgICAgIHwgICA1ICsKIHRlc3RzL01ha2VmaWxl
LnNvdXJjZXMgICAgICAgICAgIHwgICA1IC0KIHRlc3RzL2dlbV9leGVjX2xhdGVuY3kuYyAgICAg
ICAgIHwgNTA0IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIHRlc3RzL2dlbV9l
eGVjX2x1dF9oYW5kbGUuYyAgICAgIHwgMjYzIC0tLS0tLS0tLS0tLS0tLS0tLQogdGVzdHMvZ2Vt
X2ZlbmNlX3VwbG9hZC5jICAgICAgICAgfCA0MDUgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CiB0ZXN0cy9nZW1fZ3R0X3NwZWVkLmMgICAgICAgICAgICB8IDUxMCAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCiB0ZXN0cy9nZW1fcmVhZF9yZWFkX3NwZWVkLmMgICAgICB8IDIx
MyAtLS0tLS0tLS0tLS0tLS0KIHRlc3RzL21lc29uLmJ1aWxkICAgICAgICAgICAgICAgIHwgICA1
IC0KIDE0IGZpbGVzIGNoYW5nZWQsIDE5MzggaW5zZXJ0aW9ucygrKSwgMTkwNSBkZWxldGlvbnMo
LSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
