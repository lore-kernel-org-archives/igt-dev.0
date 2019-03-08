Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D2A895E7
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2019 11:29:26 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id b2so13937981pgl.9
 for <igt-dev@lists.freedesktop.org>; Fri, 08 Mar 2019 03:29:25 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Fri,  8 Mar 2019 13:29:15 +0200
Message-Id: <1552044555-19476-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] [PATCH i-g-t] HACK tests/kms_plane_multiple: add missed
 igt_display_commit2 after pipe change
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

d2hlbiBwaXBlIGNoYW5nZXMgb24gb3V0cHV0IGNvbW1pdCB0aGUgY2hhbmdlIGltbWVkaWF0ZWx5
Ci0tLQogdGVzdHMva21zX3BsYW5lX211bHRpcGxlLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3BsYW5lX211bHRpcGxlLmMg
Yi90ZXN0cy9rbXNfcGxhbmVfbXVsdGlwbGUuYwppbmRleCA2MTcwNTRkLi45NTg1NjZmIDEwMDY0
NAotLS0gYS90ZXN0cy9rbXNfcGxhbmVfbXVsdGlwbGUuYworKysgYi90ZXN0cy9rbXNfcGxhbmVf
bXVsdGlwbGUuYwpAQCAtOTIsNiArOTIsNyBAQCBzdGF0aWMgdm9pZCB0ZXN0X2ZpbmkoZGF0YV90
ICpkYXRhLCBpZ3Rfb3V0cHV0X3QgKm91dHB1dCwgaW50IG5fcGxhbmVzKQogCiAJLyogcmVzZXQg
dGhlIGNvbnN0cmFpbnQgb24gdGhlIHBpcGUgKi8KIAlpZ3Rfb3V0cHV0X3NldF9waXBlKG91dHB1
dCwgUElQRV9BTlkpOworCWlndF9kaXNwbGF5X2NvbW1pdDIoJmRhdGEtPmRpc3BsYXksIENPTU1J
VF9BVE9NSUMpOwogCiAJaWd0X3BpcGVfY3JjX2ZyZWUoZGF0YS0+cGlwZV9jcmMpOwogCWRhdGEt
PnBpcGVfY3JjID0gTlVMTDsKQEAgLTE5Nyw2ICsxOTgsNyBAQCBwcmVwYXJlX3BsYW5lcyhkYXRh
X3QgKmRhdGEsIGVudW0gcGlwZSBwaXBlX2lkLCBjb2xvcl90ICpjb2xvciwKIAlpbnQgaTsKIAog
CWlndF9vdXRwdXRfc2V0X3BpcGUob3V0cHV0LCBwaXBlX2lkKTsKKwlpZ3RfZGlzcGxheV9jb21t
aXQyKCZkYXRhLT5kaXNwbGF5LCBDT01NSVRfQVRPTUlDKTsKIAlwcmltYXJ5ID0gaWd0X291dHB1
dF9nZXRfcGxhbmVfdHlwZShvdXRwdXQsIERSTV9QTEFORV9UWVBFX1BSSU1BUlkpOwogCXBpcGUg
PSBwcmltYXJ5LT5waXBlOwogCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2
