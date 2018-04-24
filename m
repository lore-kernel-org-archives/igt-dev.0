Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EBF6E396
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Apr 2018 08:32:22 +0000 (UTC)
From: Lukasz Kalamarz <lukasz.kalamarz@intel.com>
Date: Tue, 24 Apr 2018 10:32:11 +0200
Message-Id: <20180424083212.11479-3-lukasz.kalamarz@intel.com>
In-Reply-To: <20180424083212.11479-1-lukasz.kalamarz@intel.com>
References: <20180424083212.11479-1-lukasz.kalamarz@intel.com>
Subject: [igt-dev] [PATCH i-g-t v6 3/4] lib/intel_batchbuffer: Removal of
 state variable from a intel_batchbuffer structure
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
List-ID: <igt-dev@lists.freedesktop.org>

V2l0aCBhIHJlbW92YWwgb2YgYWxsIHJlZmVyZW5jZXMgdG8gc3RhdGUgdmFyaWFibGUgdGhlcmUg
aXMKbm8gbG9uZ2VyIGFueSBuZWVkIHRvIGtlZXAgaXQgaW4gc3RydWN0dXJlLgp2NTogUmViYXNl
CgpTaWduZWQtb2ZmLWJ5OiBMdWthc3ogS2FsYW1hcnogPGx1a2Fzei5rYWxhbWFyekBpbnRlbC5j
b20+CkNjOiBLYXRhcnp5bmEgRGVjIDxrYXRhcnp5bmEuZGVjQGludGVsLmNvbT4KQ2M6IFJhZG9z
bGF3IFN6d2ljaHRlbmJlcmcgPHJhZG9zbGF3LnN6d2ljaHRlbmJlcmdAaW50ZWwuY29tPgpDYzog
RGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT4K
UmV2aWV3ZWQtYnk6IEthdGFyenluYSBEZWMgPGthdGFyenluYS5kZWNAaW50ZWwuY29tPgpSZXZp
ZXdlZC1ieTogRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGlu
dGVsLmNvbT4KLS0tCiBsaWIvaW50ZWxfYmF0Y2hidWZmZXIuaCB8IDEgLQogMSBmaWxlIGNoYW5n
ZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9saWIvaW50ZWxfYmF0Y2hidWZmZXIuaCBi
L2xpYi9pbnRlbF9iYXRjaGJ1ZmZlci5oCmluZGV4IDJjMjYyZDcuLjY3NDRiY2IgMTAwNjQ0Ci0t
LSBhL2xpYi9pbnRlbF9iYXRjaGJ1ZmZlci5oCisrKyBiL2xpYi9pbnRlbF9iYXRjaGJ1ZmZlci5o
CkBAIC0yMSw3ICsyMSw2IEBAIHN0cnVjdCBpbnRlbF9iYXRjaGJ1ZmZlciB7CiAKIAl1aW50OF90
IGJ1ZmZlcltCQVRDSF9TWl07CiAJdWludDhfdCAqcHRyLCAqZW5kOwotCXVpbnQ4X3QgKnN0YXRl
OwogfTsKIAogc3RydWN0IGludGVsX2JhdGNoYnVmZmVyICppbnRlbF9iYXRjaGJ1ZmZlcl9hbGxv
Yyhkcm1faW50ZWxfYnVmbWdyICpidWZtZ3IsCi0tIAoyLjkuNQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
