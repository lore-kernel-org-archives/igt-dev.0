Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C39898E8
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2019 20:15:23 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Wed,  8 May 2019 16:15:10 -0400
Message-Id: <20190508201512.14263-2-lyude@redhat.com>
In-Reply-To: <20190508201512.14263-1-lyude@redhat.com>
References: <20190508201512.14263-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/3] lib/aux: Use igt_assert_eq() in
 igt_drop_root()
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

RnJvbTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KClNpZ25lZC1vZmYtYnk6IEx5dWRl
IFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Ci0tLQogbGliL2lndF9hdXguYyB8IDEwICsrKysrLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvbGliL2lndF9hdXguYyBiL2xpYi9pZ3RfYXV4LmMKaW5kZXggMWE3MGVkY2MuLmNh
ZWQxZmVkIDEwMDY0NAotLS0gYS9saWIvaWd0X2F1eC5jCisrKyBiL2xpYi9pZ3RfYXV4LmMKQEAg
LTk1NywxMyArOTU3LDEzIEBAIGludCBpZ3RfZ2V0X2F1dG9yZXN1bWVfZGVsYXkoZW51bSBpZ3Rf
c3VzcGVuZF9zdGF0ZSBzdGF0ZSkKICAqLwogdm9pZCBpZ3RfZHJvcF9yb290KHZvaWQpCiB7Ci0J
aWd0X2Fzc2VydChnZXR1aWQoKSA9PSAwKTsKKwlpZ3RfYXNzZXJ0X2VxKGdldHVpZCgpLCAwKTsK
IAotCWlndF9hc3NlcnQoc2V0Z2lkKDIpID09IDApOwotCWlndF9hc3NlcnQoc2V0dWlkKDIpID09
IDApOworCWlndF9hc3NlcnRfZXEoc2V0Z2lkKDIpLCAwKTsKKwlpZ3RfYXNzZXJ0X2VxKHNldHVp
ZCgyKSwgMCk7CiAKLQlpZ3RfYXNzZXJ0KGdldGdpZCgpID09IDIpOwotCWlndF9hc3NlcnQoZ2V0
dWlkKCkgPT0gMik7CisJaWd0X2Fzc2VydF9lcShnZXRnaWQoKSwgMik7CisJaWd0X2Fzc2VydF9l
cShnZXR1aWQoKSwgMik7CiB9CiAKIC8qKgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2lndC1kZXY=
