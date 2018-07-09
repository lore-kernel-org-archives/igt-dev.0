Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Mon, 9 Jul 2018 16:19:40 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20180709131940.GR5565@intel.com>
References: <20180709102847.15553-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180709102847.15553-1-chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t] igt/gem_render_copy: Check
 for GEM before running
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBKdWwgMDksIDIwMTggYXQgMTE6Mjg6NDdBTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IGdlbV9yZW5kZXJfY29weSByZXF1aXJlcyBhIHdvcmtpbmcgR1BVIHNvIGNoZWNrIGZp
cnN0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29u
LmNvLnVrPgo+IC0tLQo+ICB0ZXN0cy9nZW1fcmVuZGVyX2NvcHkuYyB8IDEgKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvZ2VtX3JlbmRl
cl9jb3B5LmMgYi90ZXN0cy9nZW1fcmVuZGVyX2NvcHkuYwo+IGluZGV4IDgzNzNjZDczOC4uMjM4
ZTcwZTk3IDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2dlbV9yZW5kZXJfY29weS5jCj4gKysrIGIvdGVz
dHMvZ2VtX3JlbmRlcl9jb3B5LmMKPiBAQCAtNTI5LDYgKzUyOSw3IEBAIGludCBtYWluKGludCBh
cmdjLCBjaGFyICoqYXJndikKPiAgCWlndF9maXh0dXJlIHsKPiAgCQlkYXRhLmRybV9mZCA9IGRy
bV9vcGVuX2RyaXZlcl9yZW5kZXIoRFJJVkVSX0lOVEVMKTsKPiAgCQlkYXRhLmRldmlkID0gaW50
ZWxfZ2V0X2RybV9kZXZpZChkYXRhLmRybV9mZCk7Cj4gKwkJaWd0X3JlcXVpcmVfZ2VtKGRhdGEu
ZHJtX2ZkKTsKCklzIHRoZXJlIGV2ZXIgYSBjYXNlIHdoZXJlIHdlJ2QgYmUgaGFwcHkgd2l0aCBv
cGVuX2RyaXZlcigpIGZhaWxpbmc/Ckp1c3Qgd29uZGVyaW5nIGFib3V0IHB1dHRpbmcgdGhlIHJl
cXVpcmUgaW50byB0aGUgZnVuY3Rpb24gaXRzZWxmLgoKQW55d2F5cwpSZXZpZXdlZC1ieTogVmls
bGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCj4gIAo+ICAJCWRh
dGEuYnVmbWdyID0gZHJtX2ludGVsX2J1Zm1ncl9nZW1faW5pdChkYXRhLmRybV9mZCwgNDA5Nik7
Cj4gIAkJaWd0X2Fzc2VydChkYXRhLmJ1Zm1ncik7Cj4gLS0gCj4gMi4xOC4wCj4gCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBpZ3QtZGV2IG1haWxp
bmcgbGlzdAo+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2CgotLSAKVmlsbGUgU3lyasOk
bMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
