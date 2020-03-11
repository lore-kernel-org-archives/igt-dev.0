Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715AA6E52A
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2020 23:53:45 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Wed, 11 Mar 2020 16:54:46 -0700
Message-Id: <20200311235447.195238-3-jose.souza@intel.com>
In-Reply-To: <20200311235447.195238-1-jose.souza@intel.com>
References: <20200311235447.195238-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v3 3/4] tests/kms_frontbuffer_tracking: Enable
 positive test on linear tiling
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

aTkxNSBpcyBtYWtpbmcgZmVuY2VzIG5vdCBtYW5kYXRvcnkgdG8gZW5hYmxlIEZCQyBpbiBuZXdl
ciBwbGF0Zm9ybXMuCkFzIEJTcGVjIGRvIG5vdCBoYXZlIHJlc3RyaWN0aW9ucyBhZ2FpbnN0IHRp
bGluZyBmb3JtYXRzIHRvIGVuYWJsZQpGQkMgaXQgd2lsbCBiZSBwb3NzaWJsZSB0byBlbmFibGUg
RkJDIHdpdGggbGluZWFyIHRpbGluZywgc28gbGV0cyB0ZXN0Cml0LgoKdjI6Ci0gY2hhbmdlZCBm
cm9tIEdFTjExIHRvIEdFTjkgZm9sbG93aW5nIGtlcm5lbCBwYXRjaGVzCgpDYzogVmlsbGUgU3ly
asOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IFBldHJpIExhdHZhbGEg
PHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRl
IFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfZnJvbnRidWZmZXJf
dHJhY2tpbmcuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5j
IGIvdGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMKaW5kZXggY2FmOWFhZDMuLjU3M2Fk
YjI1IDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYworKysgYi90
ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYwpAQCAtMjE3MiwxMiArMjE3MiwxNCBAQCBz
dGF0aWMgdm9pZCBmb3JtYXRfZHJhd19zdWJ0ZXN0KGNvbnN0IHN0cnVjdCB0ZXN0X21vZGUgKnQp
CiAKIHN0YXRpYyBib29sIHRpbGluZ19pc192YWxpZChpbnQgZmVhdHVyZV9mbGFncywgZW51bSB0
aWxpbmdfdHlwZSB0aWxpbmcpCiB7CisJaW50IGRldmlkID0gaW50ZWxfZ2V0X2RybV9kZXZpZChk
cm0uZmQpOworCiAJaWYgKCEoZmVhdHVyZV9mbGFncyAmIEZFQVRVUkVfRkJDKSkKIAkJcmV0dXJu
IHRydWU7CiAKIAlzd2l0Y2ggKHRpbGluZykgewogCWNhc2UgVElMSU5HX0xJTkVBUjoKLQkJcmV0
dXJuIGZhbHNlOworCQlyZXR1cm4gQVRfTEVBU1RfR0VOKGRldmlkLCA5KTsKIAljYXNlIFRJTElO
R19YOgogCWNhc2UgVElMSU5HX1k6CiAJCXJldHVybiB0cnVlOwotLSAKMi4yNS4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcg
bGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
