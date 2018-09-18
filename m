Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9616E403
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Sep 2018 19:30:59 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Tue, 18 Sep 2018 12:30:43 -0700
Message-Id: <20180918193044.26123-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] lib: Reuse Gen9 mediafill on Gen11
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVs
LmNvbT4KCldlIGNhbiByZXVzZSBnZW45IG1lZGlhZmlsbCBmdW5jdGlvbiwgYmVjYXVzZSBubyBj
aGFuZ2VzCmFyZSByZXF1aXJlZCB0byBzdXBwb3J0IEdlbjExLgoKQ2M6IERhbmllbGUgQ2VyYW9s
byBTcHVyaW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+CkNjOiBLYXRhcnp5bmEg
RGVjIDxrYXRhcnp5bmEuZGVjQGludGVsLmNvbT4KQ2M6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMu
ZGVtYXJjaGlAaW50ZWwuY29tPgpDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwu
Y29tPgpUZXN0ZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIDxkYW5pZWxlLmNlcmFv
bG9zcHVyaW9AaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBLYXRhcnp5bmEgRGVjIDxrYXRhcnp5
bmEuZGVjQGludGVsLmNvbT4KLS0tCiBsaWIvaW50ZWxfYmF0Y2hidWZmZXIuYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2xpYi9pbnRlbF9iYXRjaGJ1ZmZlci5jIGIvbGliL2ludGVsX2JhdGNoYnVmZmVyLmMKaW5kZXgg
NTBlZjUzYTMuLmFiYjA3NjQyIDEwMDY0NAotLS0gYS9saWIvaW50ZWxfYmF0Y2hidWZmZXIuYwor
KysgYi9saWIvaW50ZWxfYmF0Y2hidWZmZXIuYwpAQCAtODYwLDcgKzg2MCw3IEBAIGlndF9maWxs
ZnVuY190IGlndF9nZXRfbWVkaWFfZmlsbGZ1bmMoaW50IGRldmlkKQogewogCWlndF9maWxsZnVu
Y190IGZpbGwgPSBOVUxMOwogCi0JaWYgKElTX0dFTjkoZGV2aWQpIHx8IElTX0dFTjEwKGRldmlk
KSkKKwlpZiAoSVNfR0VOOShkZXZpZCkgfHwgSVNfR0VOMTAoZGV2aWQpIHx8IElTX0dFTjExKGRl
dmlkKSkKIAkJZmlsbCA9IGdlbjlfbWVkaWFfZmlsbGZ1bmM7CiAJZWxzZSBpZiAoSVNfR0VOOChk
ZXZpZCkpCiAJCWZpbGwgPSBnZW44X21lZGlhX2ZpbGxmdW5jOwotLSAKMi4xOS4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcg
bGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
