Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F416E06A
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Apr 2018 10:57:10 +0000 (UTC)
From: Marta Lofstedt <marta.lofstedt@intel.com>
Date: Thu,  5 Apr 2018 13:58:44 +0300
Message-Id: <20180405105844.21801-1-marta.lofstedt@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_psr_sink_crc: Save runtime by not
 waiting in crc function
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIGdldF9zaW5rX2NyYyBmdW5jdGlvbiB1c2xlZXAoMzAwMDAwKSB3aXRoIG1vdGl2YXRpb246
CiJOb3cgZ2l2ZSBhIHRpbWUgZm9yIGh1bWFuIGV5ZXMiLiBIb3dldmVyLCB0aGUgZnVuY3Rpb24g
aGFzIGFscmVhZHkKZXhpdGVkIGVhcmx5IG9uIGlndF9pbnRlcmFjdGl2ZV9kZWJ1Zywgc28gbm8g
aHVtYW4gaXMgd2FpdGluZy4KQWxzbywgd2FpdGluZyBmb3Iga2V5cHJlc3MgaXMgb2Jzb2xldGUg
d2hlbiBub3QgaW4KaWd0X2ludGVyYWN0aXZlX2RlYnVnIG1vZGUuCgpTaWduZWQtb2ZmLWJ5OiBN
YXJ0YSBMb2ZzdGVkdCA8bWFydGEubG9mc3RlZHRAaW50ZWwuY29tPgotLS0KIHRlc3RzL2ttc19w
c3Jfc2lua19jcmMuYyB8IDYgLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfcHNyX3NpbmtfY3JjLmMgYi90ZXN0cy9rbXNfcHNyX3Np
bmtfY3JjLmMKaW5kZXggMmI2MGFjZjMuLjk4ZDI5YmE5IDEwMDY0NAotLS0gYS90ZXN0cy9rbXNf
cHNyX3NpbmtfY3JjLmMKKysrIGIvdGVzdHMva21zX3Bzcl9zaW5rX2NyYy5jCkBAIC0yMzYsMTIg
KzIzNiw2IEBAIHN0YXRpYyB2b2lkIGdldF9zaW5rX2NyYyhkYXRhX3QgKmRhdGEsIGNoYXIgKmNy
YykgewogCWNsb3NlKGRpcik7CiAKIAlpZ3RfZGVidWcoIiVzXG4iLCBjcmMpOwotCWlndF9kZWJ1
Z193YWl0X2Zvcl9rZXlwcmVzcygiY3JjIik7Ci0KLQkvKiBUaGUgaW1wb3J0YW50IHZhbHVlIHdh
cyBhbHJlYWR5IHRha2VuLgotCSAqIE5vdyBnaXZlIGEgdGltZSBmb3IgaHVtYW4gZXllcwotCSAq
LwotCXVzbGVlcCgzMDAwMDApOwogCiAJLyogQmxhY2sgc2NyZWVuIGlzIGFsd2F5cyBpbnZhbGlk
ICovCiAJaWd0X2Fzc2VydChzdHJuY21wKGNyYywgQ1JDX0JMQUNLLCBDUkNfTEVOKSAhPSAwKTsK
LS0gCjIuMTEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
