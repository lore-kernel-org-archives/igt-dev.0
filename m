Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D01CF89105
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Sep 2018 11:40:10 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue, 11 Sep 2018 14:38:53 +0300
Message-Id: <20180911113853.24044-2-petri.latvala@intel.com>
In-Reply-To: <20180911113853.24044-1-petri.latvala@intel.com>
References: <20180911113853.24044-1-petri.latvala@intel.com>
Subject: [igt-dev] [PATCH i-g-t 2/2] runner: Seek to the end to get to the
 end of kmsg
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
Cc: Martin Peres <martin.peres@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

V2hlbiBkcmFpbmluZyB0aGUgcmVzdCBvZiBrbXNnIHJlY29yZHMsIHJlYWQgdGhlIGNvbXBhcmUg
cmVjb3JkIGZyb20KdGhlIGVuZCBvZiBrbXNnIG9yIHlvdSBnZXQgaW5jb21wbGV0ZSBkbWVzZyBm
aWVsZHMgaW4gdGhlIHJlc3VsdHMuCgpTaWduZWQtb2ZmLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRy
aS5sYXR2YWxhQGludGVsLmNvbT4KQ2M6IEFya2FkaXVzeiBIaWxlciA8YXJrYWRpdXN6LmhpbGVy
QGludGVsLmNvbT4KQ2M6IE1hcnRpbiBQZXJlcyA8bWFydGluLnBlcmVzQGxpbnV4LmludGVsLmNv
bT4KLS0tCiBydW5uZXIvZXhlY3V0b3IuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCgpkaWZmIC0tZ2l0IGEvcnVubmVyL2V4ZWN1dG9yLmMgYi9ydW5uZXIvZXhlY3V0b3Iu
YwppbmRleCA2MGNmNGRhNS4uMzYxMTdhZjYgMTAwNjQ0Ci0tLSBhL3J1bm5lci9leGVjdXRvci5j
CisrKyBiL3J1bm5lci9leGVjdXRvci5jCkBAIC0yNDcsNiArMjQ3LDcgQEAgc3RhdGljIHZvaWQg
ZHVtcF9kbWVzZyhpbnQga21zZ2ZkLCBpbnQgb3V0ZmQpCiAKIAlpZiAoY29tcGFyZWZkIDwgMCkK
IAkJcmV0dXJuOworCWxzZWVrKGNvbXBhcmVmZCwgMCwgU0VFS19FTkQpOwogCiAJaWYgKGZjbnRs
KGttc2dmZCwgRl9TRVRGTCwgT19OT05CTE9DSykpCiAJCXJldHVybjsKLS0gCjIuMTQuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
