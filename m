Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791606E845
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2020 03:27:30 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  7 Feb 2020 04:27:25 +0100
Message-Id: <20200207032725.10731-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/igt_vec: assertion fortification
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

RW5zdXJlIG5vIG9uZSB3aWxsIHBhc3MgbmVnYXRpdmUgaW5kZXggb24gaWd0X3ZlYyBiZWNhdXNl
IGl0IGNvdWxkCmxlYWQgdG8gbWVtb3J5IGNvcnJ1cHRpb25zIGFuZCB3ZWlyZCBwcm9ncmFtIGJl
aGF2aW9yLgoKU2lnbmVkLW9mZi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5r
ZW1wY3p5bnNraUBpbnRlbC5jb20+CkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFA
bGludXguaW50ZWwuY29tPgotLS0KIGxpYi9pZ3RfdmVjLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2ln
dF92ZWMuYyBiL2xpYi9pZ3RfdmVjLmMKaW5kZXggNTkxZTU2ZmEuLmM2YmExNjRiIDEwMDY0NAot
LS0gYS9saWIvaWd0X3ZlYy5jCisrKyBiL2xpYi9pZ3RfdmVjLmMKQEAgLTQxLDcgKzQxLDcgQEAg
dm9pZCBpZ3RfdmVjX2Zpbmkoc3RydWN0IGlndF92ZWMgKnZlYykKIAogdm9pZCAqaWd0X3ZlY19l
bGVtKGNvbnN0IHN0cnVjdCBpZ3RfdmVjICp2ZWMsIGludCBpZHgpCiB7Ci0JaWd0X2Fzc2VydChp
ZHggPCB2ZWMtPmxlbik7CisJaWd0X2Fzc2VydChpZHggPj0gMCAmJiBpZHggPCB2ZWMtPmxlbik7
CiAKIAlyZXR1cm4gdmVjLT5lbGVtcyArIGlkeCAqIHZlYy0+ZWxlbV9zaXplOwogfQpAQCAtNzks
NyArNzksNyBAQCBpbnQgaWd0X3ZlY19pbmRleChjb25zdCBzdHJ1Y3QgaWd0X3ZlYyAqdmVjLCB2
b2lkICplbGVtKQogCiB2b2lkIGlndF92ZWNfcmVtb3ZlKHN0cnVjdCBpZ3RfdmVjICp2ZWMsIGlu
dCBpZHgpCiB7Ci0JaWd0X2Fzc2VydChpZHggPCB2ZWMtPmxlbik7CisJaWd0X2Fzc2VydChpZHgg
Pj0gMCAmJiBpZHggPCB2ZWMtPmxlbik7CiAKIAltZW1tb3ZlKGlndF92ZWNfZWxlbSh2ZWMsIGlk
eCksCiAJCWlndF92ZWNfZWxlbSh2ZWMsIGlkeCArIDEpLAotLSAKMi4yMy4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlz
dAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
