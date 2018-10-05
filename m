Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5520C6E8A6
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Oct 2018 18:04:47 +0000 (UTC)
From: Tomasz Lis <tomasz.lis@intel.com>
Date: Fri,  5 Oct 2018 20:04:35 +0200
Message-Id: <1538762676-15259-3-git-send-email-tomasz.lis@intel.com>
In-Reply-To: <1538762676-15259-1-git-send-email-tomasz.lis@intel.com>
References: <1538762676-15259-1-git-send-email-tomasz.lis@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2 2/3] lib: Update surface state to set
 MOCS and coherency.
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
Cc: bartosz.dunajski@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogIkxpcywgVG9tYXN6IiA8dG9tYXN6Lmxpc0BpbnRlbC5jb20+CgpIYXZpbmcgTExDIGNh
Y2hlIGVuYWJsZWQgYnkgTU9DUyBpcyByZXF1aXJlZCB0byBwZXJmb3JtIGNvaGVyZW5jeSB0ZXN0
cy4KU3VyZmFjZSBjb2hlcmVuY3kgdHlwZSBuZWVkcyB0byBiZSBzZXQgYXMgd2VsbCBmb3IgdGhh
dCB0ZXN0LgoKQ2M6IEpvb25hcyBMYWh0aW5lbiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVs
LmNvbT4KQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpDYzogTWlj
aGFsIFdpbmlhcnNraSA8bWljaGFsLndpbmlhcnNraUBpbnRlbC5jb20+CgpTaWduZWQtb2ZmLWJ5
OiBUb21hc3ogTGlzIDx0b21hc3oubGlzQGludGVsLmNvbT4KLS0tCiBsaWIvZ3B1X2NtZHMuYyB8
IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbGli
L2dwdV9jbWRzLmMgYi9saWIvZ3B1X2NtZHMuYwppbmRleCA1NTZhOTRjLi5kOWM2ZmExIDEwMDY0
NAotLS0gYS9saWIvZ3B1X2NtZHMuYworKysgYi9saWIvZ3B1X2NtZHMuYwpAQCAtMzc2LDYgKzM3
Niw5IEBAIGdlbjhfZmlsbF9zdXJmYWNlX3N0YXRlKHN0cnVjdCBpbnRlbF9iYXRjaGJ1ZmZlciAq
YmF0Y2gsCiAJc3MtPnNzMi53aWR0aCAgPSBpZ3RfYnVmX3dpZHRoKGJ1ZikgLSAxOwogCXNzLT5z
czMucGl0Y2ggID0gYnVmLT5zdHJpZGUgLSAxOwogCisJc3MtPnNzMS5tZW1vcnlfb2JqZWN0X2Nv
bnRyb2wgPSAyOworCXNzLT5zczUuY29oZXJlbmN5X3R5cGUgPSAxOworCiAJc3MtPnNzNy5zaGFk
ZXJfY2hhbmVsX3NlbGVjdF9yID0gNDsKIAlzcy0+c3M3LnNoYWRlcl9jaGFuZWxfc2VsZWN0X2cg
PSA1OwogCXNzLT5zczcuc2hhZGVyX2NoYW5lbF9zZWxlY3RfYiA9IDY7Ci0tIAoyLjcuNAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
