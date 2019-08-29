Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matt Roper <matthew.d.roper@intel.com>
Date: Thu, 29 Aug 2019 09:47:07 -0700
Message-Id: <20190829164707.30012-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_rotation_crc: Skip on platforms
 without atomic modesetting
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
To: intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyB0ZXN0IHBlcmZvcm1zIGRpc3BsYXkgdXBkYXRlcyB2aWEgQ09NTUlUX0FUT01JQywgYnV0
IGZhaWxzIHRvIGNoZWNrCnRoYXQgdGhlIHBsYXRmb3JtIGJlaW5nIHRlc3RlZCBhY3R1YWxseSBz
dXBwb3J0cyBhdG9taWMuICBUaGlzIGNhdXNlcwpmYWlsdXJlcyBvbiBzb21lIG9mIG91ciBvbGRl
ciBwcmUtZ2VuNSBwbGF0Zm9ybXMuCgpCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9w
Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA2MDEyClNpZ25lZC1vZmYtYnk6IE1hdHQgUm9wZXIgPG1h
dHRoZXcuZC5yb3BlckBpbnRlbC5jb20+Ci0tLQogdGVzdHMva21zX3JvdGF0aW9uX2NyYy5jIHwg
MSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS90ZXN0cy9r
bXNfcm90YXRpb25fY3JjLmMgYi90ZXN0cy9rbXNfcm90YXRpb25fY3JjLmMKaW5kZXggZmU0MDQ4
MTAuLjY2OGMxNzMyIDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfcm90YXRpb25fY3JjLmMKKysrIGIv
dGVzdHMva21zX3JvdGF0aW9uX2NyYy5jCkBAIC03ODAsNiArNzgwLDcgQEAgaWd0X21haW4KIAkJ
aWd0X3JlcXVpcmVfcGlwZV9jcmMoZGF0YS5nZnhfZmQpOwogCiAJCWlndF9kaXNwbGF5X3JlcXVp
cmUoJmRhdGEuZGlzcGxheSwgZGF0YS5nZnhfZmQpOworCQlpZ3RfcmVxdWlyZShkYXRhLmRpc3Bs
YXkuaXNfYXRvbWljKTsKIAl9CiAKIAlmb3IgKHN1YnRlc3QgPSBzdWJ0ZXN0czsgc3VidGVzdC0+
cm90OyBzdWJ0ZXN0KyspIHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2
