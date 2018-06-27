Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B1F6EB96
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Jun 2018 21:55:08 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Wed, 27 Jun 2018 14:53:52 -0700
Message-Id: <20180627215354.9216-1-jose.souza@intel.com>
Subject: [igt-dev] [PATCH i-g-t 1/3] lib: Reuse Gen9 mediafill on Gen11
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
ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT4KQ2M6IEthdGFyenluYSBEZWMgPGthdGFy
enluYS5kZWNAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWxlIENlcmFvbG8gU3B1cmlv
IDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBLYXRhcnp5
bmEgRGVjIDxrYXRhcnp5bmEuZGVjQGludGVsLmNvbT4KLS0tCiBsaWIvaW50ZWxfYmF0Y2hidWZm
ZXIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2xpYi9pbnRlbF9iYXRjaGJ1ZmZlci5jIGIvbGliL2ludGVsX2JhdGNo
YnVmZmVyLmMKaW5kZXggYTg1Yzc2MGMuLjUzOWYxZTUxIDEwMDY0NAotLS0gYS9saWIvaW50ZWxf
YmF0Y2hidWZmZXIuYworKysgYi9saWIvaW50ZWxfYmF0Y2hidWZmZXIuYwpAQCAtODU4LDcgKzg1
OCw3IEBAIGlndF9maWxsZnVuY190IGlndF9nZXRfbWVkaWFfZmlsbGZ1bmMoaW50IGRldmlkKQog
ewogCWlndF9maWxsZnVuY190IGZpbGwgPSBOVUxMOwogCi0JaWYgKElTX0dFTjkoZGV2aWQpIHx8
IElTX0dFTjEwKGRldmlkKSkKKwlpZiAoSVNfR0VOOShkZXZpZCkgfHwgSVNfR0VOMTAoZGV2aWQp
IHx8IElTX0dFTjExKGRldmlkKSkKIAkJZmlsbCA9IGdlbjlfbWVkaWFfZmlsbGZ1bmM7CiAJZWxz
ZSBpZiAoSVNfR0VOOChkZXZpZCkpCiAJCWZpbGwgPSBnZW44X21lZGlhX2ZpbGxmdW5jOwotLSAK
Mi4xOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
