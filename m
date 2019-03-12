Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C2789F06
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2019 16:19:06 +0000 (UTC)
From: Neel Desai <neel.desai@intel.com>
Date: Tue, 12 Mar 2019 09:12:43 -0700
Message-Id: <cover.1552406927.git.neel.desai@intel.com>
Subject: [igt-dev] [PATCH v2 0/1] Skip 2x-cursor-vs-flip subtests for gen > 9
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
To: sudeep.dutt@intel.com, maarten.lankhorst@linux.intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

U2tpcCB0aGUgZm9sbG93aW5nIGZvciBnZW4gPiA5CgoxLikgdGVzdHMva21zX2N1cnNvcl9sZWdh
Y3lAMngtY3Vyc29yLXZzLWZsaXAtYXRvbWljCjIuKSB0ZXN0cy9rbXNfY3Vyc29yX2xlZ2FjeUAy
eC1jdXJzb3ItdnMtZmxpcC1sZWdhY3kKMy4pIHRlc3RzL2ttc19jdXJzb3JfbGVnYWN5QDJ4LWxv
bmctY3Vyc29yLXZzLWZsaXAtYXRvbWljCjQuKSB0ZXN0cy9rbXNfY3Vyc29yX2xlZ2FjeUAyeC1s
b25nLWN1cnNvci12cy1mbGlwLWxlZ2FjeQoKRHVlIHRvIEREQiBhbGxvY2F0aW9uIGNoYW5nZXMs
IHdlIGhhdmUgdG8gYWRkIGFsbCB0aGUgcGxhbmVzIHRvIHRoZQpkcm1fYXRvbWljX3N0YXRlIHBv
c3QgZ2VuIDkuIFdoZW4gdGhlIHdhdGVybWFya3MgYXJlIGNvbXB1dGVkIGJ5IHRoZQprZXJuZWws
IHRoZSBjdXJzb3IgcGxhbmUgaXMgYWRkZWQgdG8gdGhlIGRybV9hdG9taWNfc3RhdGUgd2hpY2gK
aW50cm9kdWNlcyBhIGRlcGVuZGVuY3kgb24gaHdfZG9uZSBvYmplY3Qgd2hlbiB0aGUga2VybmVs
IHByb2Nlc3NlcwpEUk1fSU9DVExfTU9ERV9BVE9NSUMgYW5kIERSTV9JT0NUTF9NT0RFX0NVUlNP
UiBpbiBwYXJhbGxlbC4gVGhlcmUgaXMgbm8KcmFjZS1mcmVlIHdheSB0byBoYW5kbGUgdGhpcyBj
b3JuZXIgY2FzZS4gVGhlc2Ugc3VidGVzdHMgbWFkZSBzZW5zZSBmb3IKb2xkZXIgZ2VuZXJhdGlv
bnMgYnV0IG5vdCBhbnltb3JlLiBIZW5jZSwgc2tpcHBpbmcgdGhlc2Ugc3ViLXRlc3RzIHBvc3QK
Z2VuIDkuCgpOZWVsIERlc2FpICgxKToKICB0ZXN0cy9rbXNfY3Vyc29yX2xlZ2FjeTogU2tpcCAy
eC1jdXJzb3ItdnMtZmxpcCBzdWJ0ZXN0cyBmb3IgZ2VuID4gOQoKIHRlc3RzL2ttc19jdXJzb3Jf
bGVnYWN5LmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKLS0KMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
