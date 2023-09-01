Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 1 Sep 2023 02:21:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Message-ID: <73mgfju4usrlbao3ejqf36joimrp722pgnydmxarf6hvg5gu5s@no2ox2hlqgpj>
References: <20230829141107.1505705-1-lucas.demarchi@intel.com>
 <20230829141107.1505705-2-lucas.demarchi@intel.com>
 <ZPAzB95lw3vSqgan@bvivekan-mobl>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZPAzB95lw3vSqgan@bvivekan-mobl>
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-xe] [PATCH igt 1/4] lib: Add xe_pciids.h
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

+Rodrigo

On Thu, Aug 31, 2023 at 11:58:23AM +0530, Balasubramani Vivekanandan wrote:
>On 29.08.2023 07:11, Lucas De Marchi wrote:
>> With the introduction of Lunar Lake, igt won't be able to just re-use
>> i915_pciids.h for both drivers anymore since the support for LNL is only
>> coming with the xe module. Copy xe_pciids.h from the drm-xe-next branch
>> (up to commit b9c9020fc816 ("drm/xe/pvc: Use fast copy engines as
>> migrate engine on PVC") and start including it where needed. This brings
>> all the LNL PCI IDs.
>
>I couldn't find the commit hash b9c9020fc816. Is it lost due to rebase?
>In that case, does it make sense to use the commit hash or just keep the
>commit subject?

Rodrigo, did you tag the branch before force pushing? If so, can you
push a tag like the archive/* ones? This would allow people to see the
commit referenced, even if later we force push the branch.


Lucas De Marchi
