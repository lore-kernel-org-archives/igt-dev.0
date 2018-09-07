Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FCF46E157
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Sep 2018 10:19:45 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri,  7 Sep 2018 11:19:36 +0100
Message-Id: <20180907101936.10427-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] igt/kms_frontbuffer_tracking: Double check
 that the CRC collection is stable
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
List-ID: <igt-dev@lists.freedesktop.org>

UmVhZCB0aGUgdGFyZ2V0IENSQ3MgYSBzZWNvbmQgYW5kIHJlcXVpcmUgdGhhdCB0aGV5IGRvIG5v
dCBjaGFuZ2UsIGFzCm90aGVyd2lzZSB3ZSBrbm93IHRoYXQgdGhlIGNvbGxlY3Rpb24gb2YgQ1JD
cyBpcyB1bnJlbGlhYmxlLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJp
cy13aWxzb24uY28udWs+Ci0tLQogdGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMgfCA3
ICsrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMgYi90ZXN0cy9r
bXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYwppbmRleCBlOWFiY2ViNjYuLjhlZjA3ZTNhZSAxMDA2
NDQKLS0tIGEvdGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMKKysrIGIvdGVzdHMva21z
X2Zyb250YnVmZmVyX3RyYWNraW5nLmMKQEAgLTExOTMsNiArMTE5Myw3IEBAIHN0YXRpYyB2b2lk
IGNvbGxlY3RfY3JjKGlndF9jcmNfdCAqY3JjKQogc3RhdGljIHZvaWQgaW5pdF9ibHVlX2NyYyhl
bnVtIHBpeGVsX2Zvcm1hdCBmb3JtYXQpCiB7CiAJc3RydWN0IGlndF9mYiBibHVlOworCWlndF9j
cmNfdCBjaGVjazsKIAogCWlmIChibHVlX2NyY3NbZm9ybWF0XS5pbml0aWFsaXplZCkKIAkJcmV0
dXJuOwpAQCAtMTIxNCwxMSArMTIxNSwxMyBAQCBzdGF0aWMgdm9pZCBpbml0X2JsdWVfY3JjKGVu
dW0gcGl4ZWxfZm9ybWF0IGZvcm1hdCkKIAl9CiAKIAljb2xsZWN0X2NyYygmYmx1ZV9jcmNzW2Zv
cm1hdF0uY3JjKTsKLQogCXByaW50X2NyYygiQmx1ZSBDUkM6ICAiLCAmYmx1ZV9jcmNzW2Zvcm1h
dF0uY3JjKTsKIAotCWlndF9kaXNwbGF5X3Jlc2V0KCZkcm0uZGlzcGxheSk7CisJLyogQ2hlY2sg
dGhlIENSQyBjb2xsZWN0aW9uIEhXIGlzIHN0YWJsZSAqLworCWNvbGxlY3RfY3JjKCZjaGVjayk7
CisJaWd0X3JlcXVpcmUoaWd0X2NoZWNrX2NyY19lcXVhbCgmYmx1ZV9jcmNzW2Zvcm1hdF0uY3Jj
LCAmY2hlY2spKTsKIAorCWlndF9kaXNwbGF5X3Jlc2V0KCZkcm0uZGlzcGxheSk7CiAJaWd0X3Jl
bW92ZV9mYihkcm0uZmQsICZibHVlKTsKIAogCWJsdWVfY3Jjc1tmb3JtYXRdLmluaXRpYWxpemVk
ID0gdHJ1ZTsKLS0gCjIuMTkuMC5yYzIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldgo=
