Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from cam-smtp0.cambridge.arm.com (unknown [217.140.106.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1BE36E436
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Jun 2019 15:14:10 +0000 (UTC)
From: Liviu Dudau <liviu.dudau@arm.com>
Date: Wed, 19 Jun 2019 16:13:58 +0100
Message-Id: <20190619151358.22815-1-liviu.dudau@arm.com>
In-Reply-To: <20190618081504.GW22949@platvala-desk.ger.corp.intel.com>
References: <20190618081504.GW22949@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] Add Arm drivers as supported drivers by
 igt.
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
To: IGT GPU Tool <igt-dev@lists.freedesktop.org>
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

QWRkIHRoZSBkcml2ZXJzIG1haW50YWluZWQgYnkgQXJtIGRldmVsb3BlcnMgdG8gdGhlIGlndC4K
CnYyOiBPcmRlciB0aGUgbW9kdWxlcyBhcnJheSBlbnRyaWVzIGFscGhhYmV0aWNhbGx5LCBhcyBw
ZXIKUGV0cmkgTGF0dmFsYSdzIHN1Z2dlc3Rpb24uCgpTaWduZWQtb2ZmLWJ5OiBMaXZpdSBEdWRh
dSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4KLS0tCiBsaWIvZHJtdGVzdC5jIHwgMyArKysKIGxpYi9k
cm10ZXN0LmggfCA0ICsrKysKIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvbGliL2RybXRlc3QuYyBiL2xpYi9kcm10ZXN0LmMKaW5kZXggMjVmMjAzNTMwLi4x
N2JiODdkMWYgMTAwNjQ0Ci0tLSBhL2xpYi9kcm10ZXN0LmMKKysrIGIvbGliL2RybXRlc3QuYwpA
QCAtMjA1LDcgKzIwNSwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1vZHVsZSB7CiAJdm9pZCAo
Km1vZHByb2JlKShjb25zdCBjaGFyICpuYW1lKTsKIH0gbW9kdWxlc1tdID0gewogCXsgRFJJVkVS
X0FNREdQVSwgImFtZGdwdSIgfSwKKwl7IERSSVZFUl9IRExDRCwgImhkbGNkIiB9LAogCXsgRFJJ
VkVSX0lOVEVMLCAiaTkxNSIsIG1vZHByb2JlX2k5MTUgfSwKKwl7IERSSVZFUl9LT01FREEsICJr
b21lZGEiIH0sCisJeyBEUklWRVJfTUFMSURQLCAibWFsaV9kcCIgfSwKIAl7IERSSVZFUl9QQU5G
Uk9TVCwgInBhbmZyb3N0IiB9LAogCXsgRFJJVkVSX1YzRCwgInYzZCIgfSwKIAl7IERSSVZFUl9W
QzQsICJ2YzQiIH0sCmRpZmYgLS1naXQgYS9saWIvZHJtdGVzdC5oIGIvbGliL2RybXRlc3QuaApp
bmRleCA2YzRjMzg5OWMuLjk1MmYwYzRiNiAxMDA2NDQKLS0tIGEvbGliL2RybXRlc3QuaAorKysg
Yi9saWIvZHJtdGVzdC5oCkBAIC00NSw2ICs0NSwxMCBAQAogI2RlZmluZSBEUklWRVJfQU1ER1BV
CSgxIDw8IDQpCiAjZGVmaW5lIERSSVZFUl9WM0QJKDEgPDwgNSkKICNkZWZpbmUgRFJJVkVSX1BB
TkZST1NUCSgxIDw8IDYpCisjZGVmaW5lIERSSVZFUl9IRExDRAkoMSA8PCA3KQorI2RlZmluZSBE
UklWRVJfTUFMSURQCSgxIDw8IDgpCisjZGVmaW5lIERSSVZFUl9LT01FREEJKDEgPDwgOSkKKwog
LyoKICAqIEV4Y2x1ZGUgRFJWRVJfVkdFTSBmcm9tIERSSVZFUl9BTlkgc2luY2UgaWYgeW91IHJ1
biBvbiBhIHN5c3RlbQogICogd2l0aCB2Z2VtIGFzIHdlbGwgYXMgYSBzdXBwb3J0ZWQgZHJpdmVy
LCB5b3UgY2FuIGVuZCB1cCB3aXRoIGEKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2
