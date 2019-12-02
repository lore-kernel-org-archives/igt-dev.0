Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF5A89450
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Dec 2019 13:37:44 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Mon,  2 Dec 2019 15:37:38 +0200
Message-Id: <20191202133738.1752-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] testdisplay: Make sure readlink() result is
 nul-terminated
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

QSBzaW1pbGFyIGZpeCBhcyBpbiBjb21taXQgYTcwMDEzMTg2ZDMwICgidGVzdHMvdG9vbHNfdGVz
dDogVXNlCnJlYWRsaW5rKCkgcHJvcGVybHkiKSwgemVyby1pbml0aWFsaXplIGFuZCByZWFkIHNp
emVvZiBtaW51cyBvbmUuCgpTaWduZWQtb2ZmLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2
YWxhQGludGVsLmNvbT4KQ2M6IEFya2FkaXVzeiBIaWxlciA8YXJrYWRpdXN6LmhpbGVyQGludGVs
LmNvbT4KLS0tCgpDaGVja2VkIGFsbCBvdGhlciByZWFkbGluaygpIGNhbGxzLCB0aGlzIHdhcyB0
aGUgb25seSBvbmUgd2l0aG91dApub24tYWNjaWRlbnRhbCBudWwtdGVybWluYXRpb24uCgoKIHRl
c3RzL3Rlc3RkaXNwbGF5LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvdGVzdGRpc3BsYXkuYyBiL3Rl
c3RzL3Rlc3RkaXNwbGF5LmMKaW5kZXggMmZkYzAyMzYuLmNiNGE5NjJjIDEwMDY0NAotLS0gYS90
ZXN0cy90ZXN0ZGlzcGxheS5jCisrKyBiL3Rlc3RzL3Rlc3RkaXNwbGF5LmMKQEAgLTU2NCw5ICs1
NjQsOSBAQCBzdGF0aWMgZ2Jvb2xlYW4gaW5wdXRfZXZlbnQoR0lPQ2hhbm5lbCAqc291cmNlLCBH
SU9Db25kaXRpb24gY29uZGl0aW9uLAogCiBzdGF0aWMgdm9pZCBlbnRlcl9leGVjX3BhdGgodm9p
ZCkKIHsKLQljaGFyIHBhdGhbUEFUSF9NQVhdOworCWNoYXIgcGF0aFtQQVRIX01BWF0gPSB7fTsK
IAotCWlmIChyZWFkbGluaygiL3Byb2Mvc2VsZi9leGUiLCBwYXRoLCBzaXplb2YocGF0aCkpID4g
MCkKKwlpZiAocmVhZGxpbmsoIi9wcm9jL3NlbGYvZXhlIiwgcGF0aCwgc2l6ZW9mKHBhdGgpIC0g
MSkgPiAwKQogCQljaGRpcihkaXJuYW1lKHBhdGgpKTsKIH0KIAotLSAKMi4xOS4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcg
bGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
