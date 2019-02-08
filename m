Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1AE6E42E
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Feb 2019 17:03:09 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Fri,  8 Feb 2019 22:27:09 +0530
Message-Id: <1549645030-7494-4-git-send-email-ramalingam.c@intel.com>
In-Reply-To: <1549645030-7494-1-git-send-email-ramalingam.c@intel.com>
References: <1549645030-7494-1-git-send-email-ramalingam.c@intel.com>
Subject: [igt-dev] [PATCH i-g-t v4 3/4] kms_content_protection: Confirm that
 LIC is passed
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
To: igt-dev@lists.freedesktop.org, daniel@ffwll.ch
List-ID: <igt-dev@lists.freedesktop.org>

T25jZSB0aGUgSERDUCBpcyBlbmFibGVkLCBrZXJuZWwgd2lsbCBydW4gdGhlIGxpbmsgaW50ZWdy
aXR5IGNoZWNrKExJQykKYXRsZWFzdCBvbmNlIGluIDJTZWNzIGJhc2VkIG9uIHRoZSBIRENQIHZl
cnNpb25zLgoKU28gdG8gY29uZmlybSB0aGUgbGluayBpbnRlZ3JpdHkgY2hlY2sgaXMgcGFzc2Vk
LCB3ZSBvYmVydmUgdGhhdCBIRENQCnN0YXRlIHJlbWFpbnMgRU5BQkxFRCBmb3IgbmV4dCA0U2Vj
cy4KCnYyOgogIFJlYmFzZWQuCgpTaWduZWQtb2ZmLWJ5OiBSYW1hbGluZ2FtIEMgPHJhbWFsaW5n
YW0uY0BpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGZmd2xsLmNoPgotLS0KIHRlc3RzL2ttc19jb250ZW50X3Byb3RlY3Rpb24uYyB8IDkgKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMv
a21zX2NvbnRlbnRfcHJvdGVjdGlvbi5jIGIvdGVzdHMva21zX2NvbnRlbnRfcHJvdGVjdGlvbi5j
CmluZGV4IDdkODJjNzMzYjM3OC4uYzQzZTA4YjcxYTgzIDEwMDY0NAotLS0gYS90ZXN0cy9rbXNf
Y29udGVudF9wcm90ZWN0aW9uLmMKKysrIGIvdGVzdHMva21zX2NvbnRlbnRfcHJvdGVjdGlvbi5j
CkBAIC0yMTQsNiArMjE0LDE0IEBAIHN0YXRpYyBib29sIGlndF9waXBlX2lzX2ZyZWUoaWd0X2Rp
c3BsYXlfdCAqZGlzcGxheSwgZW51bSBwaXBlIHBpcGUpCiAJcmV0dXJuIHRydWU7CiB9CiAKK3N0
YXRpYyB2b2lkIHRlc3RfY3BfbGljKGlndF9vdXRwdXRfdCAqb3V0cHV0KQoreworCWJvb2wgcmV0
OworCisJLyogV2FpdCBmb3IgNFNlY3MgKG1pbiAyIGN5Y2xlcyBvZiBMaW5rIEludGVncml0eSBD
aGVjaykgKi8KKwlyZXQgPSB3YWl0X2Zvcl9wcm9wX3ZhbHVlKG91dHB1dCwgMSwgNCAqIDEwMDAp
OworCWlndF9hc3NlcnRfZighcmV0LCAiQ29udGVudCBQcm90ZWN0aW9uIExJQyBGYWlsZWRcbiIp
OworfQogCiBzdGF0aWMgdm9pZCB0ZXN0X2NvbnRlbnRfcHJvdGVjdGlvbl9vbl9vdXRwdXQoaWd0
X291dHB1dF90ICpvdXRwdXQsCiAJCQkJCSAgICAgIGVudW0gaWd0X2NvbW1pdF9zdHlsZSBzLApA
QCAtMjM5LDYgKzI0Nyw3IEBAIHN0YXRpYyB2b2lkIHRlc3RfY29udGVudF9wcm90ZWN0aW9uX29u
X291dHB1dChpZ3Rfb3V0cHV0X3QgKm91dHB1dCwKIAogCQltb2Rlc2V0X3dpdGhfZmIocGlwZSwg
b3V0cHV0LCBzKTsKIAkJdGVzdF9jcF9lbmFibGVfd2l0aF9yZXRyeShvdXRwdXQsIHMsIDMpOwor
CQl0ZXN0X2NwX2xpYyhvdXRwdXQpOwogCiAJCWlmIChkcG1zX3Rlc3QpIHsKIAkJCWlndF9waXBl
X3NldF9wcm9wX3ZhbHVlKGRpc3BsYXksIHBpcGUsCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
