Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F98A6E914
 for <igt-dev@lists.freedesktop.org>; Wed,  9 May 2018 17:38:08 +0000 (UTC)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Wed,  9 May 2018 10:37:37 -0700
Message-Id: <20180509173746.23405-6-dhinakaran.pandiyan@intel.com>
In-Reply-To: <20180509173746.23405-1-dhinakaran.pandiyan@intel.com>
References: <20180509173746.23405-1-dhinakaran.pandiyan@intel.com>
Subject: [igt-dev] [PATCH i-g-t 05/14] tests/psr: Assert sink CRC length and
 make use of igt_sysfs_read()
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, rodrigo.vivi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

SW5jbHVkZSBtaW5vciBmb21hdHRpbmcgY2hhbmdlIHRvby4KU2lnbmVkLW9mZi1ieTogRGhpbmFr
YXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBpbnRlbC5jb20+ClJldmlld2VkLWJ5
OiBLYXRhcnp5bmEgRGVjIDxrYXRhcnp5bmEuZGVjQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9rbXNf
cHNyX3NpbmtfY3JjLmMgfCA5ICsrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfcHNyX3NpbmtfY3Jj
LmMgYi90ZXN0cy9rbXNfcHNyX3NpbmtfY3JjLmMKaW5kZXggMzVjN2I4NDUuLmFmNjNlNjg5IDEw
MDY0NAotLS0gYS90ZXN0cy9rbXNfcHNyX3NpbmtfY3JjLmMKKysrIGIvdGVzdHMva21zX3Bzcl9z
aW5rX2NyYy5jCkBAIC0yMzAsMTQgKzIzMCwxMyBAQCBzdGF0aWMgdm9pZCBnZXRfc2lua19jcmMo
ZGF0YV90ICpkYXRhLCBjaGFyICpjcmMpCiAJaWYgKGlndF9pbnRlcmFjdGl2ZV9kZWJ1ZykKIAkJ
cmV0dXJuOwogCi0JaWd0X3JlcXVpcmVfZihpZ3Rfc3lzZnNfc2NhbmYoZGF0YS0+ZGVidWdmc19m
ZCwgImk5MTVfc2lua19jcmNfZURQMSIsCi0JCQkJICAgICAgIiVzXG4iLCBjcmMpLAorCWlndF9y
ZXF1aXJlX2YoaWd0X3N5c2ZzX3JlYWQoZGF0YS0+ZGVidWdmc19mZCwgImk5MTVfc2lua19jcmNf
ZURQMSIsCisJCQkJICAgICBjcmMsIENSQ19MRU4pID09IENSQ19MRU4sCiAJCSAgICAgICJTaW5r
IENSQyBpcyB1bnJlbGlhYmxlIG9uIHRoaXMgbWFjaGluZS4gVHJ5IG1hbnVhbCBkZWJ1ZyB3aXRo
IC0taW50ZXJhY3RpdmUtZGVidWc9bm8tY3JjXG4iKTsKLQotCWlndF9kZWJ1ZygiJXNcbiIsIGNy
Yyk7CisJaWd0X2RlYnVnKCJzaW5rIENSQzogJS4qc1xuIiwgQ1JDX0xFTiwgY3JjKTsKIAogCS8q
IEJsYWNrIHNjcmVlbiBpcyBhbHdheXMgaW52YWxpZCAqLwotCWlndF9hc3NlcnQoc3RybmNtcChj
cmMsIENSQ19CTEFDSywgQ1JDX0xFTikgIT0gMCk7CisJaWd0X2Fzc2VydChzdHJuY21wKGNyYywg
Q1JDX0JMQUNLLCBDUkNfTEVOKSk7CiB9CiAKIHN0YXRpYyBib29sIGlzX2dyZWVuKGNoYXIgKmNy
YykKLS0gCjIuMTQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
