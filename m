Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E6D6E59F
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jul 2018 22:57:52 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Mon, 16 Jul 2018 15:57:37 -0700
Message-Id: <20180716225739.10398-1-jose.souza@intel.com>
Subject: [igt-dev] [PATCH v2 i-g-t 1/3] lib: Reuse Gen9 mediafill on Gen11
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVs
LmNvbT4KCldlIGNhbiByZXVzZSBnZW45IG1lZGlhZmlsbCBmdW5jdGlvbiwgYmVjYXVzZSBubyBj
aGFuZ2VzCmFyZSByZXF1aXJlZCB0byBzdXBwb3J0IEdlbjExLgoKQ2M6IEx1Y2FzIERlIE1hcmNo
aSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPgpDYzogRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8
ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT4KQWNrZWQtYnk6IEthdGFyenluYSBEZWMg
PGthdGFyenluYS5kZWNAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWxlIENlcmFvbG8g
U3B1cmlvIDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBL
YXRhcnp5bmEgRGVjIDxrYXRhcnp5bmEuZGVjQGludGVsLmNvbT4KLS0tCiBsaWIvaW50ZWxfYmF0
Y2hidWZmZXIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2xpYi9pbnRlbF9iYXRjaGJ1ZmZlci5jIGIvbGliL2ludGVs
X2JhdGNoYnVmZmVyLmMKaW5kZXggZGZjMmNlOTYuLmU0MjAxODg2IDEwMDY0NAotLS0gYS9saWIv
aW50ZWxfYmF0Y2hidWZmZXIuYworKysgYi9saWIvaW50ZWxfYmF0Y2hidWZmZXIuYwpAQCAtODU4
LDcgKzg1OCw3IEBAIGlndF9maWxsZnVuY190IGlndF9nZXRfbWVkaWFfZmlsbGZ1bmMoaW50IGRl
dmlkKQogewogCWlndF9maWxsZnVuY190IGZpbGwgPSBOVUxMOwogCi0JaWYgKElTX0dFTjkoZGV2
aWQpIHx8IElTX0dFTjEwKGRldmlkKSkKKwlpZiAoSVNfR0VOOShkZXZpZCkgfHwgSVNfR0VOMTAo
ZGV2aWQpIHx8IElTX0dFTjExKGRldmlkKSkKIAkJZmlsbCA9IGdlbjlfbWVkaWFfZmlsbGZ1bmM7
CiAJZWxzZSBpZiAoSVNfR0VOOChkZXZpZCkpCiAJCWZpbGwgPSBnZW44X21lZGlhX2ZpbGxmdW5j
OwotLSAKMi4xOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
