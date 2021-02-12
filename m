Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD8F6E516
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Feb 2021 05:45:06 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id s5so9404871edw.8
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Feb 2021 21:45:06 -0800 (PST)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Fri, 12 Feb 2021 06:44:47 +0100
Message-Id: <20210212054447.31713-1-mario.kleiner.de@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms-hdr: Fix
 HDMI_STATIC_METADATA_TYPE1.
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
Cc: Simon Ser <contact@emersion.fr>, mario.kleiner.de@gmail.com
List-ID: <igt-dev@lists.freedesktop.org>

QWNjb3JkaW5nIHRvIHRoZSBDVEEgODYxLkcgc3BlY2lmaWNhdGlvbiwgdGFibGUgNDQKaW4gc2Vj
dGlvbiA2LjkgYW5kIGFsc28gc3BlY2lmaWNhbGx5IHNlY3Rpb24gNi45LjEsCnRoZSB2YWx1ZSBv
ZiB0aGUgY29uc3RhbnQgbXVzdCBiZSAwLCBub3QgMSwgc28gZml4CnRoaXMuCgpBbiBpZGVudGlj
YWwgZml4IGhhcyBiZWVuIHN1Ym1pdHRlZCBmb3IgaW5jbHVzaW9uIGludG8KdGhlIGtlcm5lbCBo
ZWFkZXJzICh0aGlzIGlzIG5vdCBleHBvc2VkIHVhcGkpLiBTZWU6CgpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAyMS1GZWJydWFyeS8yOTcyMzMuaHRt
bAoKRml4aW5nIHRoaXMgY29uc3RhbnQgZm9yIEtvZGkgYWxzbyBmaXhlZCBzb21lIEhEUiBUVnMs
CnNvIHRoZSB3cm9uZyBjb25zdGFudCBoYXMgcmVhbCB3b3JsZCBjb25zZXF1ZW5jZXMgb24Kc29t
ZSBkaXNwbGF5IGhhcmR3YXJlLiBTZWU6CgpodHRwczovL2dpdGh1Yi5jb20veGJtYy94Ym1jL3B1
bGwvMTkxMjkKClNpZ25lZC1vZmYtYnk6IE1hcmlvIEtsZWluZXIgPG1hcmlvLmtsZWluZXIuZGVA
Z21haWwuY29tPgpDYzogU2ltb24gU2VyIDxjb250YWN0QGVtZXJzaW9uLmZyPgpDYzogVmlsbGUg
U3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiB0ZXN0cy9rbXNf
aGRyLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfaGRyLmMgYi90ZXN0cy9rbXNfaGRyLmMKaW5kZXgg
YWE3ZTY4NWIuLmU5ZGQ3ZjI3IDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfaGRyLmMKKysrIGIvdGVz
dHMva21zX2hkci5jCkBAIC0zNSw3ICszNSw3IEBAIElHVF9URVNUX0RFU0NSSVBUSU9OKCJUZXN0
IEhEUiBtZXRhZGF0YSBpbnRlcmZhY2VzIGFuZCBicGMgc3dpdGNoIik7CiAKIC8qIERSTSBIRFIg
ZGVmaW5pdGlvbnMuIE5vdCBpbiB0aGUgVUFQSSBoZWFkZXIsIHVuZm9ydHVuYXRlbHkuICovCiBl
bnVtIGhkbWlfbWV0YWRhdGFfdHlwZSB7Ci0JSERNSV9TVEFUSUNfTUVUQURBVEFfVFlQRTEgPSAx
LAorCUhETUlfU1RBVElDX01FVEFEQVRBX1RZUEUxID0gMCwKIH07CiAKIGVudW0gaGRtaV9lb3Rm
IHsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
