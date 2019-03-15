Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800075.outbound.protection.outlook.com [40.107.80.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D7D6E455
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2019 15:05:01 +0000 (UTC)
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Date: Fri, 15 Mar 2019 11:04:42 -0400
Message-ID: <20190315150442.10237-3-nicholas.kazlauskas@amd.com>
In-Reply-To: <20190315150442.10237-1-nicholas.kazlauskas@amd.com>
References: <20190315150442.10237-1-nicholas.kazlauskas@amd.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 3/3] lib/igt_fb: Align min_stride to 256
 bytes for YUV buffers on amdgpu
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

VGhlIGNocm9tYSBhZGRyZXNzIG5lZWRzIHRvIGJlIDI1NiBieXRlIGFsaWduZWQgb24gYW1kZ3B1
IGFuZCB0aGUKZWFzaWVzdCB3YXkgdG8gZG8gc28gaXMgdG8gYWxpZ24gdGhlIG1pbmltdW0gc3Ry
aWRlIGZvciB0aGUgbHVtYS4KCnYyOiBhZGRlZCB0aGlzIHBhdGNoCgpDYzogTGVvIExpIDxzdW5w
ZW5nLmxpQGFtZC5jb20+CkNjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNv
bT4KU2lnbmVkLW9mZi1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2th
c0BhbWQuY29tPgotLS0KIGxpYi9pZ3RfZmIuYyB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9mYi5jIGIvbGliL2lndF9mYi5j
CmluZGV4IDZhOWE5MzQxLi5lODZiNWNiYyAxMDA2NDQKLS0tIGEvbGliL2lndF9mYi5jCisrKyBi
L2xpYi9pZ3RfZmIuYwpAQCAtNDY3LDYgKzQ2NywxMiBAQCBzdGF0aWMgdWludDMyX3QgY2FsY19w
bGFuZV9zdHJpZGUoc3RydWN0IGlndF9mYiAqZmIsIGludCBwbGFuZSkKIAkJc3RyaWRlID0gcm91
bmR1cF9wb3dlcl9vZl90d28oc3RyaWRlKTsKIAogCQlyZXR1cm4gc3RyaWRlOworCX0gZWxzZSBp
ZiAoaWd0X2Zvcm1hdF9pc195dXYoZmItPmRybV9mb3JtYXQpICYmIGlzX2FtZGdwdV9kZXZpY2Uo
ZmItPmZkKSkgeworCQkvKgorCQkgKiBDaHJvbWEgYWRkcmVzcyBuZWVkcyB0byBiZSBhbGlnbmVk
IHRvIDI1NiBieXRlcyBvbiBBTURHUFUKKwkJICogc28gdGhlIGVhc2llc3Qgd2F5IGlzIHRvIGFs
aWduIHRoZSBsdW1hIHN0cmlkZSB0byAyNTYuCisJCSAqLworCQlyZXR1cm4gQUxJR04obWluX3N0
cmlkZSwgMjU2KTsKIAl9IGVsc2UgewogCQl1bnNpZ25lZCBpbnQgdGlsZV93aWR0aCwgdGlsZV9o
ZWlnaHQ7CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3Qt
ZGV2
