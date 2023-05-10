Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB9F10E083
 for <igt-dev@lists.freedesktop.org>; Wed, 10 May 2023 22:14:43 +0000 (UTC)
Date: Wed, 10 May 2023 15:14:36 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <ZFwXTD5H9uDZBo/8@orsosgc001.jf.intel.com>
References: <20230506005528.1890922-1-umesh.nerlige.ramappa@intel.com>
 <20230506005528.1890922-16-umesh.nerlige.ramappa@intel.com>
 <04a7f10e-99ff-e1cd-0fe7-6f63d9e896d0@linux.intel.com>
Content-Type: multipart/mixed; boundary="ISWLyc3eVveXgdUN"
Content-Disposition: inline
In-Reply-To: <04a7f10e-99ff-e1cd-0fe7-6f63d9e896d0@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 15/15] intel_gpu_top: Add gt specific
 values to header in interactive mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--ISWLyc3eVveXgdUN
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline

On Wed, May 10, 2023 at 09:46:53AM +0100, Tvrtko Ursulin wrote:
>
>On 06/05/2023 01:55, Umesh Nerlige Ramappa wrote:
>>If -p options is specified in INTERACTIVE mode, show the gt specific
>>values.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>  tools/intel_gpu_top.c | 33 +++++++++++++++++++++++++--------
>>  1 file changed, 25 insertions(+), 8 deletions(-)
>>
>>diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
>>index 0acc81e9e..7018499c7 100644
>>--- a/tools/intel_gpu_top.c
>>+++ b/tools/intel_gpu_top.c
>>@@ -1988,14 +1988,31 @@ print_header(const struct igt_device_card *card,
>>  	lines = print_header_token(" @ ", lines, con_w, con_h, &rem,
>>  				   "%s", card->card);
>>-	lines = print_header_token(" - ", lines, con_w, con_h, &rem,
>>-				   "%s/%s MHz",
>>-				   freq_items[1].buf,
>>-				   freq_items[0].buf);
>>-
>>-	lines = print_header_token("; ", lines, con_w, con_h, &rem,
>>-				   "%s%% RC6",
>>-				   rc6_items[0].buf);
>>+	if (class_view || engines->num_gts == 1) {
>>+		lines = print_header_token(" - ", lines, con_w, con_h, &rem,
>>+					   "%s/%s MHz",
>>+					   freq_items[1].buf,
>>+					   freq_items[0].buf);
>>+
>>+		lines = print_header_token("; ", lines, con_w, con_h, &rem,
>>+					   "%s%% RC6",
>>+					   rc6_items[0].buf);
>>+	} else {
>>+		for (i = 0; i < engines->num_gts; i++) {
>>+			const char *cont = !i ? " - ": "; ";
>>+
>>+			lines = print_header_token(cont, lines, con_w, con_h, &rem,
>>+						   "%s/%s MHz(gt%d)",
>>+						   freq_items_gt[i * 4 + 1].buf,
>>+						   freq_items_gt[i * 4 + 0].buf,
>>+						   i);
>>+
>>+			lines = print_header_token("; ", lines, con_w, con_h, &rem,
>>+						   "%s%% RC6(gt%d)",
>>+						   rc6_items_gt[i * 3].buf,
>>+						   i);
>>+		}
>>+	}
>>  	if (engines->r_gpu.present) {
>>  		lines = print_header_token("; ", lines, con_w, con_h,
>
>Series was a super easy read, thanks for that! Pretty much r-b for the 
>lot from me but I would just like to visualize how the output looks 
>like first. Would you mind pasting some examples for all the modes?

great, I am attaching the outputs in text files for MTL and DG2 here, 
hope that is visible. If not, I can paste it in pastebin.

MTL shows the gt specific changes. DG2 is single tile, so there are no 
changes.

Thanks,
Umesh
>
>Regards,
>
>Tvrtko

--ISWLyc3eVveXgdUN
Content-Type: text/plain; charset="utf-8"
Content-Disposition: attachment; filename="mtl_pmu.txt"

> sudo ./intel_gpu_top -l
 Freq MHz      IRQ RC6     Power W             RCS             BCS             VCS            VECS             CCS
 req  act       /s   %   gpu   pkg       %  se  wa       %  se  wa       %  se  wa       %  se  wa       %  se  wa
   0    0       39 100  0.09 12.24    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0
   0    0        0 100  0.00  5.01    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0
   0    0        0 100  0.00  4.94    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0

> sudo ./intel_gpu_top -l -p
 Freq GT0 MHz  Freq GT1 MHz      IRQ  RC6 GT0  RC6 GT1     Power W           RCS/0           BCS/0           VCS/0           VCS/1          VECS/0           CCS/0
   req    act    req    act       /s        %        %   gpu   pkg       %  se  wa       %  se  wa       %  se  wa       %  se  wa       %  se  wa       %  se  wa
     0      0      0      0       38      100      100  0.00 11.81    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0
     0      0      0      0        0      100      100  0.00  4.97    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0
     0      0      0      0        0      100      100  0.00  4.94    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0

> sudo ./intel_gpu_top -J
[

{
        "period": {
                "duration": 27.774630,
                "unit": "ms"
        },
        "frequency": {
                "requested": 0.000000,
                "actual": 0.000000,
                "unit": "MHz"
        },
        "interrupts": {
                "count": 36.004080,
                "unit": "irq/s"
        },
        "rc6": {
                "value": 100.000000,
                "unit": "%"
        },
        "power": {
                "GPU": 0.065925,
                "Package": 11.444656,
                "unit": "W"
        },
        "engines": {
                "Render/3D": {
                        "busy": 0.000000,
                        "sema": 0.000000,
                        "wait": 0.000000,
                        "unit": "%"
                },
...

> sudo ./intel_gpu_top -J -p
[

{
        "period": {
                "duration": 26.035037,
                "unit": "ms"
        },
        "frequency-gt0": {
                "requested": 0.000000,
                "actual": 0.000000,
                "unit": "MHz"
        },
        "frequency-gt1": {
                "requested": 0.000000,
                "actual": 0.000000,
                "unit": "MHz"
        },
        "interrupts": {
                "count": 38.409778,
                "unit": "irq/s"
        },
        "rc6-gt0": {
                "value": 100.000000,
                "unit": "%"
        },
        "rc6-gt1": {
                "value": 100.000000,
                "unit": "%"
        },
        "power": {
                "GPU": 0.000000,
                "Package": 12.335953,
                "unit": "W"
        },
        "engines": {
                "Render/3D/0": {
                        "busy": 0.000000,
                        "sema": 0.000000,
                        "wait": 0.000000,
                        "unit": "%"
                },
...

> sudo ./intel_gpu_top -c
Freq MHz req,Freq MHz act,IRQ /s,RC6 %,Power W gpu,Power W pkg,RCS %,RCS se,RCS wa,BCS %,BCS se,BCS wa,VCS %,VCS se,VCS wa,VECS %,VECS se,VECS wa,CCS %,CCS se,CCS wa
0.000000,0.000000,37.859083,100.000000,0.000000,12.096698,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000
0.000000,0.000000,0.000000,100.000000,0.000000,5.024299,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000
0.000000,0.000000,0.000000,100.000000,0.000000,4.988727,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000

> sudo ./intel_gpu_top -c -p
Freq GT0 MHz req,Freq GT0 MHz act,Freq GT1 MHz req,Freq GT1 MHz act,IRQ /s,RC6 GT0 %,RC6 GT1 %,Power W gpu,Power W pkg,RCS/0 %,RCS/0 se,RCS/0 wa,BCS/0 %,BCS/0 se,BCS/0 wa,VCS/0 %,VCS/0 se,VCS/0 wa,VCS/1 %,VCS/1 se,VCS/1 wa,VECS/0 %,VECS/0 se,VECS/0 wa,CCS/0 %,CCS/0 se,CCS/0 wa
0.000000,0.000000,0.000000,0.000000,37.173657,99.998777,99.997810,0.068067,11.337693,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000
0.000000,0.000000,0.000000,0.000000,0.000000,100.000000,100.000000,0.000000,5.041599,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000
0.000000,0.000000,0.000000,0.000000,0.000000,100.000000,100.000000,0.000000,5.008404,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000

> sudo ./intel_gpu_top

intel-gpu-top: Intel Meteorlake (Gen12) @ /dev/dri/card0 -    0/   0 MHz; 100% RC6;  0.00/ 4.99 W;        0 irqs/s
...

> sudo ./intel_gpu_top -p

intel-gpu-top: Intel Meteorlake (Gen12) @ /dev/dri/card0 -      0/     0 MHz(gt0);      100% RC6(gt0);      0/     0 MHz(gt1);      100% RC6(gt1);  0.00/ 4.98 W;        0 irqs/s
...


--ISWLyc3eVveXgdUN
Content-Type: text/plain; charset="utf-8"
Content-Disposition: attachment; filename="dg2_pmu.txt"

> sudo ./intel_gpu_top -l
 Freq MHz      IRQ RC6     IMC MiB/s             RCS             BCS             VCS            VECS             CCS
 req  act       /s   %     rd     wr       %  se  wa       %  se  wa       %  se  wa       %  se  wa       %  se  wa
   0    0      195 100    144     37    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0
   0    0      142 100     25      6    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0
   0    0        0 100     85      4    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0

> sudo ./intel_gpu_top -l -p
 Freq MHz      IRQ RC6     IMC MiB/s           RCS/0           BCS/0           VCS/0           VCS/1          VECS/0          VECS/1           CCS/0           CCS/1           CCS/2           CCS/3
 req  act       /s   %     rd     wr       %  se  wa       %  se  wa       %  se  wa       %  se  wa       %  se  wa       %  se  wa       %  se  wa       %  se  wa       %  se  wa       %  se  wa
   0    0        0 100    314     55    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0
   0    0        0 100     91      7    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0
   0    0        0 100     92      5    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0

> sudo ./intel_gpu_top -J
[

{
        "period": {
                "duration": 25.839066,
                "unit": "ms"
        },
        "frequency": {
                "requested": 0.000000,
                "actual": 0.000000,
                "unit": "MHz"
        },
        "interrupts": {
                "count": 232.206536,
                "unit": "irq/s"
        },
        "rc6": {
                "value": 100.000000,
                "unit": "%"
        },
        "imc-bandwidth": {
                "reads": 299.149216,
                "writes": 20.748924,
                "unit": "MiB/s"
        },
        "engines": {
                "Render/3D": {
                        "busy": 0.000000,
                        "sema": 0.000000,
                        "wait": 0.000000,
                        "unit": "%"
                },
...

> sudo ./intel_gpu_top -J -p
[

{
        "period": {
                "duration": 24.558506,
                "unit": "ms"
        },
        "frequency": {
                "requested": 0.000000,
                "actual": 0.000000,
                "unit": "MHz"
        },
        "interrupts": {
                "count": 0.000000,
                "unit": "irq/s"
        },
        "rc6": {
                "value": 100.000000,
                "unit": "%"
        },
        "imc-bandwidth": {
                "reads": 309.006790,
                "writes": 53.386643,
                "unit": "MiB/s"
        },
        "engines": {
                "Render/3D/0": {
                        "busy": 0.000000,
                        "sema": 0.000000,
                        "wait": 0.000000,
                        "unit": "%"
                },
...

> sudo ./intel_gpu_top -c
Freq MHz req,Freq MHz act,IRQ /s,RC6 %,IMC MiB/s rd,IMC MiB/s wr,RCS %,RCS se,RCS wa,BCS %,BCS se,BCS wa,VCS %,VCS se,VCS wa,VECS %,VECS se,VECS wa,CCS %,CCS se,CCS wa
0.000000,0.000000,197.280107,100.000000,330.786144,24.573318,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000
0.000000,0.000000,149.410773,100.000000,23.879837,3.148010,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000
0.000000,0.000000,0.000000,100.000000,101.882497,5.109333,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000

> sudo ./intel_gpu_top -c -p
Freq MHz req,Freq MHz act,IRQ /s,RC6 %,IMC MiB/s rd,IMC MiB/s wr,RCS/0 %,RCS/0 se,RCS/0 wa,BCS/0 %,BCS/0 se,BCS/0 wa,VCS/0 %,VCS/0 se,VCS/0 wa,VCS/1 %,VCS/1 se,VCS/1 wa,VECS/0 %,VECS/0 se,VECS/0 wa,VECS/1 %,VECS/1 se,VECS/1 wa,CCS/0 %,CCS/0 se,CCS/0 wa,CCS/1 %,CCS/1 se,CCS/1 wa,CCS/2 %,CCS/2 se,CCS/2 wa,CCS/3 %,CCS/3 se,CCS/3 wa
0.000000,0.000000,0.000000,100.000000,340.977673,60.574177,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000
0.000000,0.000000,0.000000,100.000000,88.193030,6.309502,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000
0.000000,0.000000,0.000000,100.000000,89.373431,4.450919,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000

> sudo ./intel_gpu_top

intel-gpu-top: Intel Dg2 (Gen12) @ /dev/dri/card0 -    0/   0 MHz; 100% RC6;        0 irqs/s
...

> sudo ./intel_gpu_top -p

intel-gpu-top: Intel Dg2 (Gen12) @ /dev/dri/card0 -    0/   0 MHz; 100% RC6;        0 irqs/s
...


--ISWLyc3eVveXgdUN--
