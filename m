Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B8D6E588
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Sep 2018 10:55:53 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 20 Sep 2018 13:55:06 +0300
Message-Id: <20180920105507.23776-2-petri.latvala@intel.com>
In-Reply-To: <20180920105507.23776-1-petri.latvala@intel.com>
References: <20180920105507.23776-1-petri.latvala@intel.com>
Subject: [igt-dev] [PATCH i-g-t 2/3] runner: Lowercase the name used for
 matching -t and -x
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
List-ID: <igt-dev@lists.freedesktop.org>

QW5kIHRodXMgbWFrZSBpdCBwb3NzaWJsZSB0byBydW4gLXQgYmFzaWMtczMgZm9yIGV4YW1wbGUu
CgpTaWduZWQtb2ZmLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4K
LS0tCiBydW5uZXIvam9iX2xpc3QuYyB8IDcgKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ydW5uZXIvam9iX2xpc3Qu
YyBiL3J1bm5lci9qb2JfbGlzdC5jCmluZGV4IDg4ZjU5YjA1Li45Y2YxOWM0NSAxMDA2NDQKLS0t
IGEvcnVubmVyL2pvYl9saXN0LmMKKysrIGIvcnVubmVyL2pvYl9saXN0LmMKQEAgLTc1LDE5ICs3
NSwxNyBAQCBzdGF0aWMgdm9pZCBhZGRfc3VidGVzdHMoc3RydWN0IGpvYl9saXN0ICpqb2JfbGlz
dCwgc3RydWN0IHNldHRpbmdzICpzZXR0aW5ncywKIAl9CiAKIAl3aGlsZSAoZnNjYW5mKHAsICIl
bXMiLCAmc3VidGVzdG5hbWUpID09IDEpIHsKLQkJY2hhciAqcGlnbGl0bmFtZTsKKwkJY2hhciBw
aWdsaXRuYW1lWzI1Nl07CiAKLQkJYXNwcmludGYoJnBpZ2xpdG5hbWUsICJpZ3RAJXNAJXMiLCBi
aW5hcnksIHN1YnRlc3RuYW1lKTsKKwkJZ2VuZXJhdGVfcGlnbGl0X25hbWUoYmluYXJ5LCBzdWJ0
ZXN0bmFtZSwgcGlnbGl0bmFtZSwgc2l6ZW9mKHBpZ2xpdG5hbWUpKTsKIAogCQlpZiAoZXhjbHVk
ZSAmJiBleGNsdWRlLT5zaXplICYmIG1hdGNoZXNfYW55KHBpZ2xpdG5hbWUsIGV4Y2x1ZGUpKSB7
CiAJCQlmcmVlKHN1YnRlc3RuYW1lKTsKLQkJCWZyZWUocGlnbGl0bmFtZSk7CiAJCQljb250aW51
ZTsKIAkJfQogCiAJCWlmIChpbmNsdWRlICYmIGluY2x1ZGUtPnNpemUgJiYgIW1hdGNoZXNfYW55
KHBpZ2xpdG5hbWUsIGluY2x1ZGUpKSB7CiAJCQlmcmVlKHN1YnRlc3RuYW1lKTsKLQkJCWZyZWUo
cGlnbGl0bmFtZSk7CiAJCQljb250aW51ZTsKIAkJfQogCkBAIC0xMDMsNyArMTAxLDYgQEAgc3Rh
dGljIHZvaWQgYWRkX3N1YnRlc3RzKHN0cnVjdCBqb2JfbGlzdCAqam9iX2xpc3QsIHN0cnVjdCBz
ZXR0aW5ncyAqc2V0dGluZ3MsCiAJCX0KIAogCQlmcmVlKHN1YnRlc3RuYW1lKTsKLQkJZnJlZShw
aWdsaXRuYW1lKTsKIAl9CiAKIAlpZiAobnVtX3N1YnRlc3RzKQotLSAKMi4xOC4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcg
bGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
