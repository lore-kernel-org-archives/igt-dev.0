Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29E189DC0
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2019 14:11:28 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Mon, 13 May 2019 17:11:25 +0300
Message-Id: <20190513141125.7902-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/igt_audio: normalize samples when
 extracting channel
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

YXVkaW9fZXh0cmFjdF9jaGFubmVsX3MzMl9sZSBjb252ZXJ0cyBTMzIgc2FtcGxlcyB0byBkb3Vi
bGUuIFByaW9yIHRvIHRoaXMKcGF0Y2gsIHRoZSBvdXRwdXQgc2FtcGxlcyB3ZXJlbid0IG5vcm1h
bGl6ZWQsIHJlc3VsdGluZyBpbiB2YWx1ZXMgdXAgdG8KSU5UMzJfTUFYLgoKRnV0dXJlIGFtcGxp
dHVkZSB0ZXN0cyBuZWVkIHRvIGJlIGZvcm1hdC1hZ25vc3RpYyAoaWUuIHNob3VsZG4ndCBjYXJl
IHdoZXRoZXIKdGhlIGZvcm1hdCB1c2VkIGlzIFMxNiBvciBTMzIpLiBUaHVzLCBpdCBpcyBwcmVm
ZXJhYmxlIHRvIGFsd2F5cyB1c2Ugbm9ybWFsaXplZApkb3VibGUgdmFsdWVzLgoKVGhlIGN1cnJl
bnQgdGVzdHMgZG9uJ3QgY2hlY2sgdGhlIGFtcGxpdHVkZSAob3IgY2hlY2sgaXQgcmVsYXRpdmUg
dG8gdGhlIG1heC4Kb24gdGhlIHdob2xlIGJ1ZmZlciksIHNvIHRoZXkgc3RpbGwgcGFzcyB3aXRo
b3V0IGFueSBtb2RpZmljYXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBTaW1vbiBTZXIgPHNpbW9uLnNl
ckBpbnRlbC5jb20+Ci0tLQogbGliL2lndF9hdWRpby5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9hdWRp
by5jIGIvbGliL2lndF9hdWRpby5jCmluZGV4IGZkOGNmMDdjMGRlMy4uZjRiMTY5NTk1ZjZjIDEw
MDY0NAotLS0gYS9saWIvaWd0X2F1ZGlvLmMKKysrIGIvbGliL2lndF9hdWRpby5jCkBAIC0zODks
NyArMzg5LDcgQEAgc2l6ZV90IGF1ZGlvX2V4dHJhY3RfY2hhbm5lbF9zMzJfbGUoZG91YmxlICpk
c3QsIHNpemVfdCBkc3RfY2FwLAogCWRzdF9sZW4gPSBzcmNfbGVuIC8gbl9jaGFubmVsczsKIAlp
Z3RfYXNzZXJ0KGRzdF9sZW4gPD0gZHN0X2NhcCk7CiAJZm9yIChpID0gMDsgaSA8IGRzdF9sZW47
IGkrKykKLQkJZHN0W2ldID0gKGRvdWJsZSkgc3JjW2kgKiBuX2NoYW5uZWxzICsgY2hhbm5lbF07
CisJCWRzdFtpXSA9IChkb3VibGUpIHNyY1tpICogbl9jaGFubmVscyArIGNoYW5uZWxdIC8gSU5U
MzJfTUFYOwoKIAlyZXR1cm4gZHN0X2xlbjsKIH0KLS0KMi4yMS4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
