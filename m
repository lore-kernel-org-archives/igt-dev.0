Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8933F6E5DD
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Feb 2019 13:53:37 +0000 (UTC)
Date: Tue, 12 Feb 2019 15:53:17 +0200
Message-Id: <20190212135317.14057-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] igt_command_line.sh: Abort if run as root
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
From: Arkadiusz Hiler via igt-dev <igt-dev@lists.freedesktop.org>
Reply-To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

YG5pbmphIHRlc3RgIGludm9rZXMgaWd0X2NvbW1hbmRfbGluZS5zaCBmb3IgZWFjaCB0ZXN0IGJp
bmFyeSB0byBjaGVjawp0aGUgYmVoYXZpb3Igb2Ygc29tZSBvZiB0aGUgc3dpdGNoZXMuIE9uZSBv
ZiB0aGUgdmVyaWZpZWQgdGhpbmdzIGlzIHRoYXQKdGhlIHRlc3QgZXhpc3RzIHdpdGggbm9uLXpl
cm8gc3RhdHVzIHdoZW4gcmVxdWVzdGluZyBpbnZhbGlkIHN1YnRlc3QuCgpgLS1ydW4tc3VidGVz
dGAgcmVzdWx0cyBpbiBpZ3RfZml4dHVyZXMgYmVpbmcgZXhlY3V0ZWQgLSB0aGlzIGZpZGRsZXMK
d2l0aCB0aGUgZGV2aWNlIGFuZCBzeXNmcyBrbm9icy4KCkxldCdzIGV4aXQgZWFybHksIGlmIHdl
IGFyZSByb290LCB0byBzYXZlIHBlb3BsZSBmb3JtIHVuaW50ZW50aW9uYWwKc2lkZS1lZmZlY3Rz
IGFuZCBzdHJhbmdlIGZhaWx1cmVzLgoKQ2M6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFA
aW50ZWwuY29tPgpDYzogQW5kaSBTaHl0aSA8YW5kaS5zaHl0aUBpbnRlbC5jb20+ClNpZ25lZC1v
ZmYtYnk6IEFya2FkaXVzeiBIaWxlciA8YXJrYWRpdXN6LmhpbGVyQGludGVsLmNvbT4KLS0tCiB0
ZXN0cy9pZ3RfY29tbWFuZF9saW5lLnNoIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaWd0X2NvbW1hbmRfbGluZS5zaCBiL3Rlc3Rz
L2lndF9jb21tYW5kX2xpbmUuc2gKaW5kZXggZTA1ZWMzNGMuLjQwOGQ5NjVmIDEwMDc1NQotLS0g
YS90ZXN0cy9pZ3RfY29tbWFuZF9saW5lLnNoCisrKyBiL3Rlc3RzL2lndF9jb21tYW5kX2xpbmUu
c2gKQEAgLTEwMCw2ICsxMDAsMTAgQEAgY2hlY2tfdGVzdCAoKQogCS4vJHRlc3QgLS1ydW4tc3Vi
dGVzdCBpbnZhbGlkLXN1YnRlc3QgPiAvZGV2L251bGwgMj4mMSAmJiBmYWlsICR0ZXN0CiB9CiAK
K2lmIFsgIiRFVUlEIiAtZXEgMCBdOyB0aGVuCisgICAgZmFpbCAiRG9uJ3QgcnVuICQwIGFzIHJv
b3QuIEl0IGV4ZWN1dGVzIGlndF9maXh0dXJlIGJsb2Nrcy4iCitmaQorCiBURVNUTElTVEZJTEU9
IiR0ZXN0c19kaXIvdGVzdC1saXN0LnR4dCIKIGlmIFsgISAtciAiJFRFU1RMSVNURklMRSIgXTsg
dGhlbgogCXRlc3RzX2Rpcj0idGVzdHMiCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldg==
