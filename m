Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 21 Nov 2019 07:29:34 -0000
Message-ID: <157432137482.19250.12703464795657656844@emeril.freedesktop.org>
References: <20191121071331.87420-1-venkata.s.dhanalakota@intel.com>
In-Reply-To: <20191121071331.87420-1-venkata.s.dhanalakota@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_failure_for_te?=
 =?utf-8?q?st/i915=3A_gem=5Fctx=5Fexec=3A_Drop_engine_in_invalid_context_s?=
 =?utf-8?q?ubtest?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

PT0gU2VyaWVzIERldGFpbHMgPT0KClNlcmllczogdGVzdC9pOTE1OiBnZW1fY3R4X2V4ZWM6IERy
b3AgZW5naW5lIGluIGludmFsaWQgY29udGV4dCBzdWJ0ZXN0ClVSTCAgIDogaHR0cHM6Ly9wYXRj
aHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82OTgwNC8KU3RhdGUgOiBmYWlsdXJlCgo9PSBT
dW1tYXJ5ID09CgpFUlJPUiEgVGhpcyBzZXJpZXMgaW50cm9kdWNlcyBuZXcgdW5kb2N1bWVudGVk
IHRlc3RzOgoKZ2VtX2N0eF9leGVjQGJhc2ljLWludmFsaWQtY29udGV4dAoKQ2FuIHlvdSBkb2N1
bWVudCB0aGVtIGFzIHBlciB0aGUgcmVxdWlyZW1lbnQgaW4gdGhlIFtDT05UUklCVVRJTkcubWRd
PwoKW0RvY3VtZW50YXRpb25dIGhhcyBtb3JlIGRldGFpbHMgb24gaG93IHRvIGRvIHRoaXMuCgpI
ZXJlIGFyZSBmZXcgZXhhbXBsZXM6Cmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0v
aWd0LWdwdS10b29scy9jb21taXQvMDMxNjY5NWQwM2FhNDYxMDgyOTZiMjdmMzk4MmVjOTMyMDBj
N2E2ZQpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2lndC1ncHUtdG9vbHMvY29t
bWl0LzQ0M2NjNjU4ZTFlNmI0OTJlZTE3YmY0ZjRkODkxMDI5ZWI3YTIwNWQKClRoYW5rcyBpbiBh
ZHZhbmNlIQoKW0NPTlRSSUJVVElORy5tZF06IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy9kcm0vaWd0LWdwdS10b29scy9ibG9iL21hc3Rlci9DT05UUklCVVRJTkcubWQjTDE5CltEb2N1
bWVudGF0aW9uXTogaHR0cHM6Ly9kcm0ucGFnZXMuZnJlZWRlc2t0b3Aub3JnL2lndC1ncHUtdG9v
bHMvaWd0LWdwdS10b29scy1Db3JlLmh0bWwjaWd0LWRlc2NyaWJlCgpPdGhlciB0aGFuIHRoYXQs
IHBpcGVsaW5lIHN0YXR1czogU1VDQ0VTUy4KCnNlZSBodHRwczovL2dpdGxhYi5mcmVlZGVza3Rv
cC5vcmcvZ2Z4LWNpL2lndC1jaS10YWdzL3BpcGVsaW5lcy84MTIwMiBmb3IgdGhlIG92ZXJ2aWV3
LgoKPT0gTG9ncyA9PQoKRm9yIG1vcmUgZGV0YWlscyBzZWU6IGh0dHBzOi8vZ2l0bGFiLmZyZWVk
ZXNrdG9wLm9yZy9nZngtY2kvaWd0LWNpLXRhZ3MvcGlwZWxpbmVzLzgxMjAyCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
