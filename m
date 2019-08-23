Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263726EC84
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Aug 2019 12:29:18 +0000 (UTC)
From: Jani Nikula <jani.nikula@intel.com>
Date: Fri, 23 Aug 2019 15:29:12 +0300
Message-Id: <20190823122912.28180-2-jani.nikula@intel.com>
In-Reply-To: <20190823122912.28180-1-jani.nikula@intel.com>
References: <20190823122912.28180-1-jani.nikula@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tools/intel_vbt_decode: dump all
 backlight data
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
Cc: jani.nikula@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

V2Ugd2VyZSBtaXNzaW5nIHRoZSBsZXZlbCBhbmQgY29udHJvbCBtZXRob2QuCgpTaWduZWQtb2Zm
LWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgotLS0KIHRvb2xzL2ludGVs
X3ZidF9kZWNvZGUuYyB8IDkgKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvaW50ZWxfdmJ0X2RlY29kZS5j
IGIvdG9vbHMvaW50ZWxfdmJ0X2RlY29kZS5jCmluZGV4IDI1Mzk5ZDMzYjhkYi4uZGViYTQ3OTk0
Yzg5IDEwMDY0NAotLS0gYS90b29scy9pbnRlbF92YnRfZGVjb2RlLmMKKysrIGIvdG9vbHMvaW50
ZWxfdmJ0X2RlY29kZS5jCkBAIC0yMjksNiArMjI5LDcgQEAgc3RhdGljIHZvaWQgZHVtcF9iYWNr
bGlnaHRfaW5mbyhzdHJ1Y3QgY29udGV4dCAqY29udGV4dCwKIHsKIAljb25zdCBzdHJ1Y3QgYmRi
X2xmcF9iYWNrbGlnaHRfZGF0YSAqYmFja2xpZ2h0ID0gYmxvY2stPmRhdGE7CiAJY29uc3Qgc3Ry
dWN0IGxmcF9iYWNrbGlnaHRfZGF0YV9lbnRyeSAqYmxjOworCWNvbnN0IHN0cnVjdCBsZnBfYmFj
a2xpZ2h0X2NvbnRyb2xfbWV0aG9kICpjb250cm9sOwogCWludCBpOwogCiAJaWYgKHNpemVvZigq
YmxjKSAhPSBiYWNrbGlnaHQtPmVudHJ5X3NpemUpIHsKQEAgLTI1MCw4ICsyNTEsMTQgQEAgc3Rh
dGljIHZvaWQgZHVtcF9iYWNrbGlnaHRfaW5mbyhzdHJ1Y3QgY29udGV4dCAqY29udGV4dCwKIAkJ
cHJpbnRmKCJcdFx0QWN0aXZlIGxvdzogJXVcbiIsIGJsYy0+YWN0aXZlX2xvd19wd20pOwogCQlw
cmludGYoIlx0XHRQV00gZnJlcTogJXVcbiIsIGJsYy0+cHdtX2ZyZXFfaHopOwogCQlwcmludGYo
Ilx0XHRNaW5pbXVtIGJyaWdodG5lc3M6ICV1XG4iLCBibGMtPm1pbl9icmlnaHRuZXNzKTsKLQl9
CiAKKwkJcHJpbnRmKCJcdFx0TGV2ZWw6ICV1XG4iLCBiYWNrbGlnaHQtPmxldmVsW2ldKTsKKwor
CQljb250cm9sID0gJmJhY2tsaWdodC0+YmFja2xpZ2h0X2NvbnRyb2xbaV07CisKKwkJcHJpbnRm
KCJcdFx0Q29udHJvbCB0eXBlOiAldVxuIiwgY29udHJvbC0+dHlwZSk7CisJCXByaW50ZigiXHRc
dENvbnRyb2xsZXI6ICV1XG4iLCBjb250cm9sLT5jb250cm9sbGVyKTsKKwl9CiB9CiAKIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgewotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXY=
