Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E4C6E0E6
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Mar 2021 19:00:22 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Mon, 29 Mar 2021 22:00:16 +0300
Message-Id: <20210329190016.13394-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20210329190016.13394-1-ville.syrjala@linux.intel.com>
References: <20210329190016.13394-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] intel-ci: Remove pixel-format-pipe-A*
 from the pre-merge blacklist
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCldl
J3ZlIGhhZCBzZXZlcmFsIHdhdGVybWFyayBidWdzIHNsaXAgdGhyb3VnaCB0aGUgbmV0IHdpdGgg
YWxsCnRoZSBwaXhlbCBmb3JtYXQgdGVzdCBiZWluZyBibGFja2xpc3RlZC4gTGV0J3MgcnVuIHRo
ZXNlIG9uCm9uZSBwaXBlIHNvIHRoYXQgd2UgbWlnaHQgY2F0Y2ggYXQgbGVhc3Qgc29tZSBvZiB0
aGUgYnVncy4KVGhpcyB3aWxsIGNvc3QgdXMgb25seSB+MTUgc2Vjb25kcyBvbiBpY2wgdGhlc2Ug
ZGF5cy4KClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51
eC5pbnRlbC5jb20+Ci0tLQogdGVzdHMvaW50ZWwtY2kvYmxhY2tsaXN0LXByZS1tZXJnZS50eHQg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS90ZXN0cy9pbnRlbC1jaS9ibGFja2xpc3QtcHJlLW1lcmdlLnR4dCBiL3Rlc3Rz
L2ludGVsLWNpL2JsYWNrbGlzdC1wcmUtbWVyZ2UudHh0CmluZGV4IGNkZGI3N2MxZjMwMy4uNjM2
M2E3YWM4NmRjIDEwMDY0NAotLS0gYS90ZXN0cy9pbnRlbC1jaS9ibGFja2xpc3QtcHJlLW1lcmdl
LnR4dAorKysgYi90ZXN0cy9pbnRlbC1jaS9ibGFja2xpc3QtcHJlLW1lcmdlLnR4dApAQCAtMTcw
LDcgKzE3MCw3IEBAIGlndEBnZW1fdGlsZWRfd2MKICMKICMgRGF0YSBhY3F1aXJlZCBvbiAyMDIw
LTAyLTIwIGJ5IE1hcnRpbiBQZXJlcwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwotaWd0QGttc19w
bGFuZUBwaXhlbC1mb3JtYXQtcGlwZS1bYS1kXS1wbGFuZXMoLXNvdXJjZS1jbGFtcGluZyk/Citp
Z3RAa21zX3BsYW5lQHBpeGVsLWZvcm1hdC1waXBlLVtiLWRdLXBsYW5lcygtc291cmNlLWNsYW1w
aW5nKT8KIAogCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCi0tIAoyLjI2LjIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
