Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm0-x241.google.com (mail-wm0-x241.google.com
 [IPv6:2a00:1450:400c:c09::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A96586E4B0
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Sep 2018 13:49:57 +0000 (UTC)
Received: by mail-wm0-x241.google.com with SMTP id b19-v6so8092622wme.3
 for <igt-dev@lists.freedesktop.org>; Wed, 05 Sep 2018 06:49:57 -0700 (PDT)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Wed,  5 Sep 2018 14:49:38 +0100
Message-Id: <20180905134939.2942-13-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20180905134939.2942-1-tvrtko.ursulin@linux.intel.com>
References: <20180905134939.2942-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATH i-g-t 12/13] media-bench: Write out trace files
 directly.
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

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCkluc3RlYWQg
b2YgcmVseWluZyBvbiBzaGVsbCByZWRpcmVjdGlvbi4KClNpZ25lZC1vZmYtYnk6IFR2cnRrbyBV
cnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Ci0tLQogc2NyaXB0cy9tZWRpYS1iZW5j
aC5wbCB8IDI0ICsrKysrKysrKysrKysrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE4IGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9tZWRpYS1i
ZW5jaC5wbCBiL3NjcmlwdHMvbWVkaWEtYmVuY2gucGwKaW5kZXggOWJmOGM4Nzg5ZmUyLi43N2U3
NWM3OGIxMTMgMTAwNzU1Ci0tLSBhL3NjcmlwdHMvbWVkaWEtYmVuY2gucGwKKysrIGIvc2NyaXB0
cy9tZWRpYS1iZW5jaC5wbApAQCAtMTYyLDYgKzE2MiwyMSBAQCBzdWIgcnVuX3dvcmtsb2FkCiAJ
cmV0dXJuICgkdGltZSwgJHdwcyk7CiB9CiAKK3N1YiBkdW1wX2NtZAoreworCW15ICgkY21kLCAk
ZmlsZSkgPSBAXzsKKworCXNob3dfY21kKCIkY21kID4gJGZpbGUiKTsKKworCW9wZW4gRk9VVCwg
Jz4nLCAkZmlsZSBvciBkaWU7CisJb3BlbiBUSU4sICIkY21kIHwiIG9yIGRpZTsKKwl3aGlsZSAo
PFRJTj4pIHsKKwkJcHJpbnQgRk9VVCAkXzsKKwl9CisJY2xvc2UgVElOOworCWNsb3NlIEZPVVQ7
Cit9CisKIHN1YiB0cmFjZV93b3JrbG9hZAogewogCW15ICgkd3JrLCAkYiwgJHIsICRjKSA9IEBf
OwpAQCAtMjEyLDE1ICsyMjcsMTIgQEAgc3ViIHRyYWNlX3dvcmtsb2FkCiAJJGIgPX4gcy9bIDw+
XS9fL2c7CiAJJGZpbGUgPSAiJHt3cmt9XyR7Yn1fLXIke3J9Xy1jJHtjfSI7CiAKLQkkY21kID0g
InBlcmYgc2NyaXB0ID4gJHtmaWxlfS50cmFjZSI7Ci0Jc2hvd19jbWQoJGNtZCk7Ci0Jc3lzdGVt
KCRjbWQpID09IDAgb3IgZGllOworCWR1bXBfY21kKCdwZXJmIHNjcmlwdCcsICIke2ZpbGV9LnRy
YWNlIik7CiAKIAkkY21kID0gInBlcmYgc2NyaXB0IHwgJHRyYWNlcGwgLS1odG1sIC14IGN0eHNh
dmUgLXMgLWMgIjsKIAkkY21kIC49IGpvaW4gJyAnLCBtYXAoIi1pICRfIiwgQHNraXBfZW5naW5l
KTsKLQkkY21kIC49ICIgPiAke2ZpbGV9Lmh0bWwiOwotCXNob3dfY21kKCRjbWQpOwotCXN5c3Rl
bSgkY21kKSA9PSAwIG9yIGRpZTsKKworCWR1bXBfY21kKCRjbWQsICIke2ZpbGV9Lmh0bWwiKTsK
IAogCXJldHVybiBcJWVuZ2luZXM7CiB9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldgo=
