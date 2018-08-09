Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734A16E6C9
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Aug 2018 10:12:36 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Thu,  9 Aug 2018 13:12:32 +0300
Message-Id: <1533809554-27925-1-git-send-email-mika.kahola@intel.com>
Subject: [igt-dev] [PATCH i-g-t v3 0/2] tests/kms_flip: Binary mode
 optimizations
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

a21zX2ZsaXAgaW4gYmluYXJ5IG1vZGUgdGFrZXMgY29uc2lkZXJhYmxlIGFtb3VudCBvZiB0aW1l
IHRvIGNvbXBsZXRlLgpUaGVzZSBjb3VwbGUgb2YgcGF0Y2hlcyBpbnRyb2R1Y2VzIG9wdGltaXph
dGlvbnMgdG8gdGhlIHRlc3QuIFRoZSBmaXJzdApwYXRjaCBzZXRzIHRoZSBzdWJ0ZXN0IGR1cmF0
aW9uIHRvIGJlIGEgY29uZmlndXJhYmxlIGNvbW1hbmQgbGluZSBwYXJhbWV0ZXIuClRoZSBzZWNv
bmQgcGF0Y2ggc3VnZ2VzdHMgdGhlIGNoYW5nZSBpbiBleGVjdXRpb24gb3JkZXIgc28gdGhhdCBh
bGwgYmFzaWMKc3VidGVzdHMgYXJlIGV4ZWN1dGVkIGZpcnN0IGFuZCBhZnRlciB0aGF0IG1vdmUg
b24gdG8gZXhlY3V0ZSAyWCB0ZXN0cy4KClRoZSBiaW5hcnkgbW9kZSBleGVjdXRpb24gdGltZSBv
biBHTEsgcGxhdGZvcm0gcmVkdWNlZCBmcm9tIDExODkgc2Vjb25kcwpkb3duIHRvIDUzNiBzZWNv
bmRzICgyWCB0ZXN0cyBza2lwcGVkIGFzIHRlc3QgcGxhdGZvcm0gaGFkIG9ubHkgMSBkaXNwbGF5
CmNvbm5lY3RlZCkKCkZvciBWSVotMTQzMjQKCnYyOiBFeGVjdXRlIHN1YnRlc3Qgb25jZSBieSBk
ZWZhdWx0CnYzOiBGb3Igaml0dGVyIGNvcG11dGF0aW9uLCBpbmNyZWFzZSBkZWZhdWx0IHRpbWVv
dXQgZm9yIHN1YnRlc3RzIHRvCiAgICAzIHNlY29uZHMgKFZpbGxlKQoKTWlrYSBLYWhvbGEgKDIp
OgogIHRlc3RzL2ttc19mbGlwOiBTZXQgZHVyYXRpb24gZm9yIHN1YnRlc3QgZnJvbSBjb21tYW5k
IGxpbmUKICB0ZXN0cy9rbXNfZmxpcDogQ2hhbmdlIDJ4IHRlc3RzIGV4ZWN1dGlvbiBvcmRlcgoK
IHRlc3RzL2ttc19mbGlwLmMgfCAxMzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDg2IGluc2VydGlvbnMoKyks
IDQ1IGRlbGV0aW9ucygtKQoKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXYK
