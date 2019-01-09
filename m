Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2E089DA4
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jan 2019 12:29:02 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed,  9 Jan 2019 14:28:29 +0200
Message-Id: <20190109122829.713-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/fb: Fix rgb24 to nv12 conversion
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
Cc: Martin Liska <mliska@suse.cz>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

QSB0eXBvIGZpeCBpbiAxeDIgcGl4ZWwgYmxvY2sgY29udmVyc2lvbiBjb2RlLCByZXZlYWxlZCBi
eSBHQ0MgOQoKRml4ZXM6IDFjN2VmMzg5MDA0NSAoImxpYjogVXNlIGlndF9tYXRyaXggZm9yIHlj
YmNyPC0+cmdiIGNvbnZlcnNpb24iKQpCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9w
Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA5MjU3ClJlcG9ydGVkLWJ5OiBNYXJ0aW4gTGlza2EgPG1s
aXNrYUBzdXNlLmN6PgpTaWduZWQtb2ZmLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxh
QGludGVsLmNvbT4KQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRl
bC5jb20+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50
ZWwuY29tPgotLS0KIGxpYi9pZ3RfZmIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZmIuYyBiL2xpYi9p
Z3RfZmIuYwppbmRleCA4MjQ0ZTUxNy4uNWNkMTgyOWEgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfZmIu
YworKysgYi9saWIvaWd0X2ZiLmMKQEAgLTE3NzksNyArMTc3OSw3IEBAIHN0YXRpYyB2b2lkIGNv
bnZlcnRfcmdiMjRfdG9fbnYxMihzdHJ1Y3QgZmJfY29udmVydCAqY3Z0KQogCQkJc3RydWN0IGln
dF92ZWM0IHl1dlsyXTsKIAogCQkJcmVhZF9yZ2IoJnJnYlswXSwgJnJnYjI0W2ogKiA4ICsgMF0p
OwotCQkJcmVhZF9yZ2IoJnJnYlsyXSwgJnJnYjI0W2ogKiA4ICsgMCArIHJnYjI0X3N0cmlkZV0p
OworCQkJcmVhZF9yZ2IoJnJnYlsxXSwgJnJnYjI0W2ogKiA4ICsgMCArIHJnYjI0X3N0cmlkZV0p
OwogCiAJCQl5dXZbMF0gPSBpZ3RfbWF0cml4X3RyYW5zZm9ybSgmbSwgJnJnYlswXSk7CiAJCQl5
dXZbMV0gPSBpZ3RfbWF0cml4X3RyYW5zZm9ybSgmbSwgJnJnYlsxXSk7Ci0tIAoyLjE5LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
