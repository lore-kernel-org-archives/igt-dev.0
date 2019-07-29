Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A63898A4
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2019 15:22:46 +0000 (UTC)
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Date: Mon, 29 Jul 2019 17:15:11 +0300
Message-Id: <20190729141511.9360-1-stanislav.lisovskiy@intel.com>
Subject: [igt-dev] [PATCH i-g-t v1] igt/lib: Start using x and y params for
 gpu walk
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
Cc: stanislav.lisovskiy@intel.com, ville.syrjala@intel.com, martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

V2hpbGUgZG9pbmcgc29tZSBncHUgZmlsbCBiYXNlZCB0ZXN0cywgbm90aWNlZCB0aGF0CmFjdHVh
bGx5IHRoZSB4IGFuZCB5IHBhcmFtZXRlcnMgZG8gbm90IGFmZmVjdCB0aGUKZmlsbGVkIGFyZWEg
YXQgYWxsLgpBZnRlciBzaG9ydCBzdHVkeSBsb29rcyBsaWtlIGdlbjhfZ3BncHVfd2FsayB3YXMg
bm90CnVzaW5nIHRob3NlIGF0IGFsbC4KU3RhcnRlZCB1c2luZyB0aG9zZSBhY2NvcmRpbmcgdG8g
YnNwZWMsIHNvIG5vdyBpdCBpcwphY3R1YWxseSBwb3NzaWJsZSB0byB1c2UgaW5pdGlhbCB4IGFu
ZCB5IHZhbHVlcy4KClNpZ25lZC1vZmYtYnk6IFN0YW5pc2xhdiBMaXNvdnNraXkgPHN0YW5pc2xh
di5saXNvdnNraXlAaW50ZWwuY29tPgotLS0KIGxpYi9ncHVfY21kcy5jIHwgNCArKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2xpYi9ncHVfY21kcy5jIGIvbGliL2dwdV9jbWRzLmMKaW5kZXggOGQyNzBlZTguLjQ4ZGRmYTBj
IDEwMDY0NAotLS0gYS9saWIvZ3B1X2NtZHMuYworKysgYi9saWIvZ3B1X2NtZHMuYwpAQCAtNjgx
LDEyICs2ODEsMTIgQEAgZ2VuOF9lbWl0X2dwZ3B1X3dhbGsoc3RydWN0IGludGVsX2JhdGNoYnVm
ZmVyICpiYXRjaCwKIAkJICAwKTsgLyogd2lkdGg6MSAqLwogCiAJLyogdGhyZWFkIGdyb3VwIFgg
Ki8KLQlPVVRfQkFUQ0goMCk7CisJT1VUX0JBVENIKHgpOwogCU9VVF9CQVRDSCgwKTsKIAlPVVRf
QkFUQ0goeF9kaW0pOwogCiAJLyogdGhyZWFkIGdyb3VwIFkgKi8KLQlPVVRfQkFUQ0goMCk7CisJ
T1VUX0JBVENIKHkpOwogCU9VVF9CQVRDSCgwKTsKIAlPVVRfQkFUQ0goeV9kaW0pOwogCi0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
